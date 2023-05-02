import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';
import 'backend/backend.dart';
import 'backend/push_notifications/push_notifications_util.dart';
import 'backend/firebase/firebase_config.dart';
import 'backend/register_notification.dart';
import 'tools/theme.dart';
import 'tools/util.dart';
import 'tools/internationalization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tools/nav/nav.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();

  await FlutterFlowTheme.initialize();

  final appState = FFAppState(); // Initialize FFAppState
  final registerNotifcation = NotificationManager();

  if (!kIsWeb) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => appState,
      ),
      ChangeNotifierProvider(
        create: (context) => registerNotifcation,
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  NotificationManager _notificationManger = NotificationManager();

  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late Stream<YagriFirebaseUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  final authUserSub = authenticatedUserStream.listen((_) {});
  final fcmTokenSub = fcmTokenUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    _notificationManger.initialize();
    _notificationManger.registerNotification();

    _appStateNotifier = AppStateNotifier();
    _router = createRouter(_appStateNotifier);
    userStream = yagriFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(seconds: 1),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'YAGRI APP',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
        Locale('fr'),
      ],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'homePage';
  late Widget? _currentPage;
  late int totalNotifications;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'homePage': HomePageWidget(),
      'listdevice': ListdeviceWidget(),
      'tasks': TasksWidget(),
      'WeatherPage': WeatherPageWidget(),
      'MessagePage': MessagePageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);
    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        selectedItemColor: FlutterFlowTheme.of(context).primaryColor,
        unselectedItemColor: FlutterFlowTheme.of(context).grayLight,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 24.0,
            ),
            activeIcon: Icon(
              Icons.home_rounded,
              size: 24.0,
            ),
            label: FFLocalizations.of(context).getText(
              'j9yj3qn2' /* • */,
            ),
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.devices_outlined,
              size: 24.0,
            ),
            activeIcon: Icon(
              Icons.devices_rounded,
              size: 24.0,
            ),
            label: FFLocalizations.of(context).getText(
              '1p73p8ip' /* • */,
            ),
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.tasks,
              size: 24.0,
            ),
            activeIcon: FaIcon(
              FontAwesomeIcons.tasks,
              size: 24.0,
            ),
            label: FFLocalizations.of(context).getText(
              '7okqyhyn' /* • */,
            ),
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.wind,
              size: 24.0,
            ),
            label: FFLocalizations.of(context).getText(
              '1lxea9sm' /* • */,
            ),
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              label: StreamBuilder<List<ChatsRecord>>(
                  stream: queryChatsRecord(
                    queryBuilder: (chatsRecord) => chatsRecord
                        .where('users', arrayContains: currentUserReference)
                        .orderBy('last_message_time', descending: true),
                  ),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("0",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600));
                    }
                    List<ChatsRecord> listViewChatsRecordList = snapshot.data!;
                    /* seen: listViewChatsRecord.lastMessageSeenBy!
                                  .contains(currentUserReference)*/
                    /*  print(listViewChatsRecordList);*/
                    int counter = 0;
                    listViewChatsRecordList.forEach(
                      (listViewChatsRecord) {
                        if (!listViewChatsRecord.lastMessageSeenBy!
                            .contains(currentUserReference)) {
                          counter++;
                        }
                      },
                    );
                    return Text("$counter",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600));
                  }),
              child: Icon(
                Icons.chat_bubble_outline,
                size: 24.0,
              ),
            ),
            activeIcon: Icon(
              Icons.chat_bubble_rounded,
              size: 24.0,
            ),
            label: '',
            tooltip: '',
          )
        ],
      ),
    );
  }
}
