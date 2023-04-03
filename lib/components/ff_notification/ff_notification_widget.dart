import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ff_notification_model.dart';
export 'ff_notification_model.dart';

class FfNotificationWidget extends StatefulWidget {
  @override
  _FfNotificationWidgetState createState() => _FfNotificationWidgetState();
}

class _FfNotificationWidgetState extends State<FfNotificationWidget> {
  late FfNotificationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FfNotificationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 0,
          sigmaY: 0,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(202, 14, 21, 27),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 450,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          thickness: 3,
                          indent: 150,
                          endIndent: 150,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'oyf8a277' /* Notification  */,
                            ),
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                        ),
                        StreamBuilder<List<FfUserPushNotificationRecord>>(
                          stream: queryFfUserPushNotificationRecord(
                            queryBuilder: (ffUserPushNotificationRecord) =>
                                ffUserPushNotificationRecord
                                    .where('sender',
                                        isEqualTo: currentUserReference)
                                    .orderBy('timestamp', descending: true),
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

                            if (snapshot.data!.isEmpty) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(top: 60, left: 50),
                                child: Center(
                                  child: SizedBox(
                                      width: 300,
                                      height: 70,
                                      child: Text(
                                        "There is no notification!",
                                        style: TextStyle(fontSize: 20),
                                      )),
                                ),
                              );
                            }

                            List<FfUserPushNotificationRecord>
                                columnFfUserPushNotificationRecordList =
                                snapshot.data!;

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  columnFfUserPushNotificationRecordList.length,
                                  (columnIndex) {
                                final columnFfUserPushNotificationRecord =
                                    columnFfUserPushNotificationRecordList[
                                        columnIndex];
                                return GestureDetector(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'FF_NOTIF_COMP_ON_BTN_UPDATE_MARKED');
                                    logFirebaseEvent('Button_backend_call');
                                    // ignore: non_constant_identifier_names

                                    print("true");
                                    if (columnFfUserPushNotificationRecord
                                            .marked ==
                                        true) {
                                      final FfUserPushNotificationCreateData =
                                          createFfUserPushNotificationRecordData(
                                              marked: false);
                                      await columnFfUserPushNotificationRecord
                                          .ffRef!
                                          .update(
                                              FfUserPushNotificationCreateData);
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.toggle_on_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 45,
                                            ),
                                            Text(
                                              columnFfUserPushNotificationRecord
                                                  .notificationTitle!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 20,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 0, 0, 0),
                                              child: Text(
                                                columnFfUserPushNotificationRecord
                                                    .notificationText!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 16,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 40, 0),
                                          child: Text(
                                            dateTimeFormat(
                                              'd/M h:mm a',
                                              columnFfUserPushNotificationRecord
                                                  .timestamp!,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 15,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.only(
                                                  start: 0.0, end: 8.0),
                                          child: Container(
                                            width: 12.0,
                                            height: 12.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: columnFfUserPushNotificationRecord
                                                              .marked !=
                                                          null &&
                                                      columnFfUserPushNotificationRecord
                                                              .marked ==
                                                          true
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryColor
                                                  : Colors.transparent,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
