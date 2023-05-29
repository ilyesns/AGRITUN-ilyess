import 'package:awesome_dialog/awesome_dialog.dart';

import '../../auth/auth_util.dart';
import '../../components/device_details_widget.dart';
import '../../components/share_user/share_user_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/empty_platform_dev/empty_platform_dev_widget.dart';
import '/components/pop_updp/pop_updp_widget.dart';
import '/components/set_location/set_location_widget.dart';
import '../../tools/icon_button.dart';
import '../../tools/theme.dart';
import '../../tools/util.dart';
import '../../tools/widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/tools/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'device_model.dart';
export 'device_model.dart';

class DeviceWidget extends StatefulWidget {
  const DeviceWidget({
    Key? key,
    this.platformRef,
  }) : super(key: key);

  final DocumentReference? platformRef;

  @override
  _DeviceWidgetState createState() => _DeviceWidgetState();
}

class _DeviceWidgetState extends State<DeviceWidget> {
  late DeviceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'listDeviceDetails'});
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

    return StreamBuilder<PlatformsRecord>(
      stream: PlatformsRecord.getDocument(widget.platformRef!),
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
        final platformRecord = snapshot.data!;
        // final exists = platformRecord.users!;
        final exists = platformRecord.owner == currentUserReference;
        return Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 15, left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            context.pop();
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Icon(Icons.arrow_back_ios,
                                size: 25,
                                color:
                                    FlutterFlowTheme.of(context).primaryText),
                          ),
                        ),
                        Text(
                          platformRecord.platName!,
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineLargeFamily),
                        ),
                        InkWell(
                          onTap: exists
                              ? () async {
                                  logFirebaseEvent(
                                      'LIST_DEVICE_DETAILS_EDIT_PLATFORM_BTN_ON');
                                  logFirebaseEvent('Button_navigate_to');

                                  context.pushNamed(
                                    'platformDetails',
                                    queryParams: {
                                      'platformDetails': serializeParam(
                                        widget.platformRef,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                }
                              : () async {
                                  await UsersRecord.getDocumentOnce(
                                          platformRecord.owner!)
                                      .then((value) {
                                    value.displayName;
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.infoReverse,
                                      animType: AnimType.scale,
                                      title: FFLocalizations.of(context).getText(
                                          'pqq4yvj2' /* Email verification */
                                          ),
                                      desc:
                                          '${FFLocalizations.of(context).getText('pqq4yvj1')} ${value.displayName}',
                                      autoHide: const Duration(seconds: 5),
                                      onDismissCallback: (type) {
                                        debugPrint(
                                            'Dialog Dissmiss from callback $type');
                                      },
                                    ).show();
                                  });
                                },
                          child: Icon(
                            exists ? Icons.settings : Icons.six_ft_apart_sharp,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      width: 300,
                      child: FutureBuilder<ApiCallResponse>(
                          future: WeatherCall.call(
                            lat: functions.latitude(platformRecord.location),
                            lon: functions.longitude(platformRecord.location),
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

                            if (snapshot.hasError ||
                                snapshot.data!.jsonBody == null) {
                              return Container(
                                width: 200,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 8,
                                      color: Color(0x230E151B),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      FFLocalizations.of(context)
                                          .getText('pqq4yvji'),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                              fontSize: 17,
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText),
                                    ),
                                  ),
                                ),
                              );
                            }
                            final containerWeatherResponse = snapshot.data!;
                            return Container(
                              width: 300,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        child: custom_widgets.IconWeather(
                                          width: 60,
                                          height: 60,
                                          api: functions.apiconlist(
                                              (WeatherCall.iconlist(
                                                containerWeatherResponse
                                                    .jsonBody,
                                              ) as List)
                                                  .map<String>(
                                                      (s) => s.toString())
                                                  .toList()
                                                  .toList(),
                                              0),
                                        ),
                                      ),
                                      Text(
                                        functions.apiconlist(
                                            (WeatherCall.weathermain(
                                              containerWeatherResponse.jsonBody,
                                            ) as List)
                                                .map<String>(
                                                    (s) => s.toString())
                                                .toList()
                                                .toList(),
                                            0),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                                fontSize: 17,
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayLight),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              functions.apitemplist(
                                                  (WeatherCall.templist(
                                                    containerWeatherResponse
                                                        .jsonBody,
                                                  ) as List)
                                                      .map<String>(
                                                          (s) => s.toString())
                                                      .toList()
                                                      .toList(),
                                                  0),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineMedium
                                                  .override(
                                                      fontSize: 32,
                                                      fontFamily: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineLargeFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Text(
                                                '°C',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelLarge
                                                    .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayLight),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4.5),
                                          child: Text(
                                            FFLocalizations.of(context)
                                                .getText("j7qthvxh"),
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                    fontSize: 17,
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLargeFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayLight),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              functions.apihumiditylist(
                                                  (WeatherCall.humlist(
                                                    containerWeatherResponse
                                                        .jsonBody,
                                                  ) as List)
                                                      .map<String>(
                                                          (s) => s.toString())
                                                      .toList()
                                                      .toList(),
                                                  0),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineMedium
                                                  .override(
                                                      fontSize: 32,
                                                      fontFamily: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineLargeFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Text(
                                                '%',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelLarge
                                                    .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayLight),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4.5),
                                          child: Text(
                                            FFLocalizations.of(context)
                                                .getText("j7qthvxj"),
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                    fontSize: 17,
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLargeFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayLight),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width > 500
                          ? 500
                          : MediaQuery.of(context).size.width,
                      height: 520,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 15, right: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context)
                                      .getText('pqq4yvjz'),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmallFamily,
                                          color: Colors.white),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: double.infinity,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: StreamBuilder<List<DevicesRecord>>(
                                stream: queryDevicesRecord(
                                  queryBuilder: (devicesRecord) => devicesRecord
                                      .where('idPlat',
                                          isEqualTo: platformRecord.reference)
                                      .where("users", arrayContainsAny: [
                                    currentUserReference
                                  ]),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
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
                                    return Center(
                                        child: Container(
                                            child: EmptyPlatformDevWidget(
                                      idPlatform: widget.platformRef,
                                    )));
                                  }
                                  List<DevicesRecord>
                                      gridViewDevicesRecordList =
                                      snapshot.data!;

                                  return GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 10.0,
                                      childAspectRatio: 1.5,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: gridViewDevicesRecordList.length,
                                    itemBuilder: (context, gridViewIndex) {
                                      final gridViewDevicesRecord =
                                          gridViewDevicesRecordList[
                                              gridViewIndex];

                                      return FutureBuilder<ApiCallResponse>(
                                          future: MqttApiListClientCall.call(),
                                          builder: (context, snapshot) {
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

                                            if (snapshot.hasError ||
                                                snapshot.data!.jsonBody ==
                                                    null) {
                                              return Container(
                                                width: 200,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText('pqq4yvjx'),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }

                                            final deviceCardMqttApiListClientResponse =
                                                snapshot.data!;

                                            return Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: valueOrDefault<Color>(
                                                  functions.apiListClient(
                                                          gridViewDevicesRecord
                                                              .sn_device,
                                                          (MqttApiListClientCall
                                                                  .listclient(
                                                            deviceCardMqttApiListClientResponse
                                                                .jsonBody,
                                                          ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList()
                                                              .map((e) =>
                                                                  e.toString())
                                                              .toList()
                                                              .toList())!
                                                      ? Colors.white
                                                      : Color.fromARGB(
                                                          100, 82, 83, 83),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                                ),
                                              ),
                                              child: InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'LISTDEVICE_PAGE_Row_ejqyltcb_ON_TAP');
                                                  if (functions.apiListClient(
                                                      gridViewDevicesRecord
                                                          .sn_device,
                                                      (MqttApiListClientCall
                                                              .listclient(
                                                        deviceCardMqttApiListClientResponse
                                                            .jsonBody,
                                                      ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList()
                                                          .map((e) =>
                                                              e.toString())
                                                          .toList()
                                                          .toList())!) {
                                                    logFirebaseEvent(
                                                        'Row_bottom_sheet');
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      barrierColor:
                                                          Color(0x00000000),
                                                      enableDrag: true,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .viewInsets,
                                                          child:
                                                              DeviceDetailsWidget(
                                                            sn_device:
                                                                gridViewDevicesRecord,
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  } else {
                                                    return;
                                                  }
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          functions.apiListClient(
                                                                      gridViewDevicesRecord.sn_device,
                                                                      (MqttApiListClientCall.listclient(
                                                                        deviceCardMqttApiListClientResponse
                                                                            .jsonBody,
                                                                      ) as List)
                                                                          .map<String>((s) => s.toString())
                                                                          .toList()
                                                                          .map((e) => e.toString())
                                                                          .toList()
                                                                          .toList()) ==
                                                                  true
                                                              ? 'assets/images/smart-sensor.png'
                                                              : 'assets/images/agritech.png',
                                                          width: 30,
                                                          height: 30,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      10.0,
                                                                      10.0,
                                                                      10.0),
                                                          child: Text(
                                                            gridViewDevicesRecord
                                                                .devName!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    functions.apiListClient(
                                                                            gridViewDevicesRecord.sn_device,
                                                                            (MqttApiListClientCall.listclient(
                                                                              deviceCardMqttApiListClientResponse.jsonBody,
                                                                            ) as List)
                                                                                .map<String>((s) => s.toString())
                                                                                .toList()
                                                                                .map((e) => e.toString())
                                                                                .toList()
                                                                                .toList())!
                                                                        ? Colors.black
                                                                        : Color.fromARGB(100, 255, 255, 255),
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryColor,
                                                                  ),
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      functions.apiListClient(
                                                                  gridViewDevicesRecord
                                                                      .sn_device,
                                                                  (MqttApiListClientCall
                                                                          .listclient(
                                                                    deviceCardMqttApiListClientResponse
                                                                        .jsonBody,
                                                                  ) as List)
                                                                      .map<String>(
                                                                          (s) => s
                                                                              .toString())
                                                                      .toList()
                                                                      .map((e) => e
                                                                          .toString())
                                                                      .toList()
                                                                      .toList()) ==
                                                              true
                                                          ? FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                              'yna04pj6' /* Online */,
                                                            )
                                                          : FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                              'yna04pj5' /* Offline */,
                                                            ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: functions.apiListClient(
                                                                            gridViewDevicesRecord.sn_device,
                                                                            (MqttApiListClientCall.listclient(
                                                                              deviceCardMqttApiListClientResponse.jsonBody,
                                                                            ) as List)
                                                                                .map<String>((s) => s.toString())
                                                                                .toList()
                                                                                .map((e) => e.toString())
                                                                                .toList()
                                                                                .toList()) ==
                                                                        true
                                                                    ? FlutterFlowTheme.of(context).secondary
                                                                    : Color.fromARGB(255, 134, 54, 54),
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
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
                ],
              ),
            ));
      },
    );
  }
}
