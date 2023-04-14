import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/addplatform/addplatform_widget.dart';
import '/components/device_details_widget.dart';
import '/components/empty_platform_dev/empty_platform_dev_widget.dart';
import '/components/empty_platform_list/empty_platform_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'listdevice_model.dart';
export 'listdevice_model.dart';

class ListdeviceWidget extends StatefulWidget {
  const ListdeviceWidget({Key? key}) : super(key: key);

  @override
  _ListdeviceWidgetState createState() => _ListdeviceWidgetState();
}

class _ListdeviceWidgetState extends State<ListdeviceWidget> {
  late ListdeviceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListdeviceModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'listdevice'});
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

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
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
        final listdeviceUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              logFirebaseEvent('LISTDEVICE_FloatingActionButton_y1pxltat');
              logFirebaseEvent('FloatingActionButton_bottom_sheet');
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                barrierColor: Color(0x00000000),
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: AddplatformWidget(),
                  );
                },
              ).then((value) => setState(() {}));
            },
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            elevation: 8.0,
            child: Icon(
              Icons.add_rounded,
              color: FlutterFlowTheme.of(context).textColor,
              size: 36.0,
            ),
          ),
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            title: Text(
              FFLocalizations.of(context).getText(
                'bz111zc4' /* Devices */,
              ),
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SafeArea(
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 500.0,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StreamBuilder<List<PlatformsRecord>>(
                      stream: queryPlatformsRecord(
                        queryBuilder: (platformsRecord) => platformsRecord
                            .where('idUser', isEqualTo: currentUserReference),
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
                        List<PlatformsRecord> listViewPlatformsRecordList =
                            snapshot.data!;
                        if (listViewPlatformsRecordList.isEmpty) {
                          return Center(
                            child: Container(
                              height: 500.0,
                              child: EmptyPlatformListWidget(),
                            ),
                          );
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewPlatformsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewPlatformsRecord =
                                listViewPlatformsRecordList[listViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 15.0, 16.0, 15.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.5,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x230E151B),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 12.0, 12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              listViewPlatformsRecord.platName!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 22.0,
                                                      ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'LISTDEVICE_PAGE_Icon_f85mdt6b_ON_TAP');
                                                logFirebaseEvent(
                                                    'Icon_navigate_to');

                                                context.pushNamed(
                                                  'platformDetails',
                                                  queryParams: {
                                                    'platformDetails':
                                                        serializeParam(
                                                      listViewPlatformsRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Icon(
                                                Icons.settings,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 30.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: StreamBuilder<
                                              List<DevicesRecord>>(
                                            stream: queryDevicesRecord(
                                              queryBuilder: (devicesRecord) =>
                                                  devicesRecord
                                                      .where('idPlat',
                                                          isEqualTo:
                                                              listViewPlatformsRecord
                                                                  .reference)
                                                      .where('idUser',
                                                          isEqualTo:
                                                              currentUserReference),
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
                                              List<DevicesRecord>
                                                  listViewDevicesRecordList =
                                                  snapshot.data!;
                                              if (listViewDevicesRecordList
                                                  .isEmpty) {
                                                return Center(
                                                  child: Container(
                                                    width: 200.0,
                                                    height: 100.0,
                                                    child:
                                                        EmptyPlatformDevWidget(
                                                      idPlatform:
                                                          listViewPlatformsRecord
                                                              .reference,
                                                    ),
                                                  ),
                                                );
                                              }
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewDevicesRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewDevicesRecord =
                                                      listViewDevicesRecordList[
                                                          listViewIndex];
                                                  return FutureBuilder<
                                                      ApiCallResponse>(
                                                    future:
                                                        MqttApiListClientCall
                                                            .call(),
                                                    builder:
                                                        (context, snapshot) {
                                                      // ignore: unnecessary_null_comparison

                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 70,
                                                            height: 70,
                                                            child: Image.asset(
                                                              'assets/images/loader.gif',
                                                              fit: BoxFit
                                                                  .fitWidth,
                                                            ),
                                                          ),
                                                        );
                                                      }

                                                      if (snapshot.data ==
                                                          null) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 150,
                                                            height: 70,
                                                            child: Text(
                                                                "Something went wrong , try again"),
                                                          ),
                                                        );
                                                      }

                                                      final deviceCardMqttApiListClientResponse =
                                                          snapshot.data!;
                                                      return Container(
                                                        width: 100.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'LISTDEVICE_PAGE_Row_ejqyltcb_ON_TAP');
                                                            if (functions
                                                                .apiListClient(
                                                                    listViewDevicesRecord
                                                                        .sn_device,
                                                                    (MqttApiListClientCall
                                                                            .listclient(
                                                                      deviceCardMqttApiListClientResponse
                                                                          .jsonBody,
                                                                    ) as List)
                                                                        .map<String>((s) => s
                                                                            .toString())
                                                                        .toList()
                                                                        .map((e) =>
                                                                            e.toString())
                                                                        .toList()
                                                                        .toList())!) {
                                                              logFirebaseEvent(
                                                                  'Row_bottom_sheet');
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                barrierColor: Color(
                                                                    0x00000000),
                                                                enableDrag:
                                                                    true,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Padding(
                                                                    padding: MediaQuery.of(
                                                                            context)
                                                                        .viewInsets,
                                                                    child:
                                                                        DeviceDetailsWidget(
                                                                      sn_device:
                                                                          listViewDevicesRecord,
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));
                                                            } else {
                                                              return;
                                                            }
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                child: Container(
                                                                    width: 250.0,
                                                                    height: 60.0,
                                                                    decoration: BoxDecoration(
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        functions.apiListClient(
                                                                                listViewDevicesRecord.sn_device,
                                                                                (MqttApiListClientCall.listclient(
                                                                                  deviceCardMqttApiListClientResponse.jsonBody,
                                                                                ) as List)
                                                                                    .map<String>((s) => s.toString())
                                                                                    .toList()
                                                                                    .map((e) => e.toString())
                                                                                    .toList()
                                                                                    .toList())!
                                                                            ? Color(0xFF8FB43A)
                                                                            : Color.fromARGB(157, 82, 83, 83),
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryColor,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    child: // Generated code for this Row Widget...
                                                                        Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            if (functions.apiListClient(
                                                                                    listViewDevicesRecord.sn_device,
                                                                                    (MqttApiListClientCall.listclient(
                                                                                      deviceCardMqttApiListClientResponse.jsonBody,
                                                                                    ) as List)
                                                                                        .map<String>((s) => s.toString())
                                                                                        .toList()
                                                                                        .map((e) => e.toString())
                                                                                        .toList()
                                                                                        .toList()) ??
                                                                                true)
                                                                              Image.asset(
                                                                                'assets/images/smart-sensor.png',
                                                                                width: 30,
                                                                                height: 30,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            if (!functions.apiListClient(
                                                                                listViewDevicesRecord.sn_device,
                                                                                (MqttApiListClientCall.listclient(
                                                                                  deviceCardMqttApiListClientResponse.jsonBody,
                                                                                ) as List)
                                                                                    .map<String>((s) => s.toString())
                                                                                    .toList()
                                                                                    .map((e) => e.toString())
                                                                                    .toList()
                                                                                    .toList())!)
                                                                              Image.asset(
                                                                                'assets/images/agritech.png',
                                                                                width: 30,
                                                                                height: 30,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                          ],
                                                                        ),
                                                                        Text(
                                                                          listViewDevicesRecord
                                                                              .devName!,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: FlutterFlowTheme.of(context).textColor,
                                                                                fontSize: 20,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          functions.apiListClient(
                                                                                      listViewDevicesRecord.sn_device,
                                                                                      (MqttApiListClientCall.listclient(
                                                                                        deviceCardMqttApiListClientResponse.jsonBody,
                                                                                      ) as List)
                                                                                          .map<String>((s) => s.toString())
                                                                                          .toList()
                                                                                          .map((e) => e.toString())
                                                                                          .toList()
                                                                                          .toList()) ==
                                                                                  true
                                                                              ? FFLocalizations.of(context).getText(
                                                                                  'yna04pj6' /* Online */,
                                                                                )
                                                                              : FFLocalizations.of(context).getText(
                                                                                  'yna04pj5' /* Offline */,
                                                                                ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: functions.apiListClient(
                                                                                            listViewDevicesRecord.sn_device,
                                                                                            (MqttApiListClientCall.listclient(
                                                                                              deviceCardMqttApiListClientResponse.jsonBody,
                                                                                            ) as List)
                                                                                                .map<String>((s) => s.toString())
                                                                                                .toList()
                                                                                                .map((e) => e.toString())
                                                                                                .toList()
                                                                                                .toList()) ==
                                                                                        true
                                                                                    ? Color.fromARGB(255, 100, 99, 99)
                                                                                    : Color(0xFFFF0000),
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    )),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
