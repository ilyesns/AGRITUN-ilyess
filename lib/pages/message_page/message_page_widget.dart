import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'message_page_model.dart';
export 'message_page_model.dart';

class MessagePageWidget extends StatefulWidget {
  const MessagePageWidget({Key? key}) : super(key: key);

  @override
  _MessagePageWidgetState createState() => _MessagePageWidgetState();
}

class _MessagePageWidgetState extends State<MessagePageWidget> {
  late MessagePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessagePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MessagePage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'vsmgpojt' /* All Chats */,
            ),
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.person_add_alt,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30,
              ),
              onPressed: () async {
                logFirebaseEvent('MESSAGE_person_add_alt_ICN_ON_TAP');
                logFirebaseEvent('IconButton_navigate_to');

                context.pushNamed('InviteUser');
              },
            ),
          ],
          centerTitle: true,
          elevation: 4,
        ),
        body: SafeArea(
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: 500,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                child: StreamBuilder<List<ChatsRecord>>(
                  stream: queryChatsRecord(
                    queryBuilder: (chatsRecord) => chatsRecord
                        .where('users', arrayContains: currentUserReference)
                        .orderBy('last_message_time', descending: true),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 70,
                          height: 70,
                          child: Image.asset(
                            'assets/images/loader.gif',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      );
                    }
                    List<ChatsRecord> listViewChatsRecordList = snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewChatsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewChatsRecord =
                            listViewChatsRecordList[listViewIndex];
                        return StreamBuilder<FFChatInfo>(
                          stream: FFChatManager.instance
                              .getChatInfo(chatRecord: listViewChatsRecord),
                          builder: (context, snapshot) {
                            final chatInfo = snapshot.data ??
                                FFChatInfo(listViewChatsRecord);
                            return FFChatPreview(
                              onTap: () => context.pushNamed(
                                'ChatPage',
                                queryParams: {
                                  'chatUser': serializeParam(
                                    chatInfo.otherUsers.length == 1
                                        ? chatInfo.otherUsersList.first
                                        : null,
                                    ParamType.Document,
                                  ),
                                  'chatRef': serializeParam(
                                    chatInfo.chatRecord.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'chatUser': chatInfo.otherUsers.length == 1
                                      ? chatInfo.otherUsersList.first
                                      : null,
                                },
                              ),
                              lastChatText: chatInfo.chatPreviewMessage(),
                              lastChatTime: listViewChatsRecord.lastMessageTime,
                              seen: listViewChatsRecord.lastMessageSeenBy!
                                  .contains(currentUserReference),
                              title: chatInfo.chatPreviewTitle(),
                              userProfilePic: chatInfo.chatPreviewPic(),
                              color: Color(0xFFEEF0F5),
                              unreadColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              titleTextStyle: GoogleFonts.getFont(
                                'DM Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              dateTextStyle: GoogleFonts.getFont(
                                'DM Sans',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                              previewTextStyle: GoogleFonts.getFont(
                                'DM Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                              borderRadius: BorderRadius.circular(0),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
