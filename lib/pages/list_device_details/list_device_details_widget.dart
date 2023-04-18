import '../../auth/auth_util.dart';
import '../../components/device_details_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/empty_platform_dev/empty_platform_dev_widget.dart';
import '/components/pop_updp/pop_updp_widget.dart';
import '/components/set_location/set_location_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_device_details_model.dart';
export 'list_device_details_model.dart';

class ListDeviceDetailsWidget extends StatefulWidget {
  const ListDeviceDetailsWidget({
    Key? key,
    this.platformRef,
  }) : super(key: key);

  final DocumentReference? platformRef;

  @override
  _ListDeviceDetailsWidgetState createState() =>
      _ListDeviceDetailsWidgetState();
}

class _ListDeviceDetailsWidgetState extends State<ListDeviceDetailsWidget> {
  late ListDeviceDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListDeviceDetailsModel());

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
        final listDeviceDetailsPlatformsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                logFirebaseEvent('LIST_DEVICE_DETAILS_Icon_gdr9cbkn_ON_TAP');
                logFirebaseEvent('Icon_navigate_back');
                context.pop();
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).grayLight,
                size: 32.0,
              ),
            ),
            title: Text(
              listDeviceDetailsPlatformsRecord.platName!,
              style: FlutterFlowTheme.of(context).title1,
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: Align(
            alignment: AlignmentDirectional(0.0, -0.85),
            child: Container(
              width: 500.0,
              decoration: BoxDecoration(
                color: Color(0x00FFFFFF),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 4.0, 20.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'LIST_DEVICE_DETAILS_ADD_DEVICE_BTN_ON_TA');
                                logFirebaseEvent('Button_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: true,
                                  context: context,
                                  builder: (bottomSheetContext) {
                                    return Padding(
                                      padding: MediaQuery.of(bottomSheetContext)
                                          .viewInsets,
                                      child: PopUpdpWidget(
                                        idPlat: widget.platformRef,
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                              text: FFLocalizations.of(context).getText(
                                'fozmzu8u' /* Add device */,
                              ),
                              options: FFButtonOptions(
                                width: 130.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: TextStyle(
                                  color: FlutterFlowTheme.of(context).info,
                                ),
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).info,
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
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
                              },
                              text: FFLocalizations.of(context).getText(
                                'xz7lllc8' /* Edit platform */,
                              ),
                              options: FFButtonOptions(
                                width: 130.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '5w8b37zx' /* Weather forecast */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 22.0,
                                  ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 8.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: Color(0x99C4C6C9),
                              icon: Icon(
                                Icons.north_east,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'LIST_DEVICE_DETAILS_north_east_ICN_ON_TA');
                                logFirebaseEvent('IconButton_navigate_to');

                                context.pushNamed('WeatherPage');
                              },
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (listDeviceDetailsPlatformsRecord.location != null)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: AuthUserStreamWidget(
                                builder: (context) =>
                                    FutureBuilder<ApiCallResponse>(
                                  future: WeatherCall.call(
                                    lat: functions.latitude(
                                        listDeviceDetailsPlatformsRecord
                                            .location),
                                    lon: functions.longitude(
                                        listDeviceDetailsPlatformsRecord
                                            .location),
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

                                    if (snapshot.data == null) {
                                      return Center(
                                        child: SizedBox(
                                          width: 150,
                                          height: 70,
                                          child: Text(
                                              "Something went wrong , try again"),
                                        ),
                                      );
                                    }
                                    final containerWeatherResponse =
                                        snapshot.data!;
                                    return Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 60.0,
                                                    height: 60.0,
                                                    child: custom_widgets
                                                        .IconWeather(
                                                      width: 60.0,
                                                      height: 60.0,
                                                      api: functions.apiconlist(
                                                          (WeatherCall.iconlist(
                                                            containerWeatherResponse
                                                                .jsonBody,
                                                          ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList()
                                                              ?.toList(),
                                                          0),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        WeatherCall.cityname(
                                                          containerWeatherResponse
                                                              .jsonBody,
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  fontSize: 20,
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: Text(
                                                          dateTimeFormat(
                                                            'EEEE',
                                                            getCurrentTimestamp,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            functions.apitemplist(
                                                                (WeatherCall.templist(
                                                                  containerWeatherResponse
                                                                      .jsonBody,
                                                                ) as List)
                                                                    .map<String>((s) => s.toString())
                                                                    .toList()
                                                                    ?.map((e) => e.toString())
                                                                    .toList()
                                                                    ?.toList(),
                                                                0),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'jgmzgl45' /* °C */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                        'd/M H:mm',
                                                        getCurrentTimestamp,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontSize: 18.0,
                                                              ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FaIcon(
                                                              FontAwesomeIcons
                                                                  .handHoldingWater,
                                                              color: Color(
                                                                  0xFF31C9FF),
                                                              size: 24.0,
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.apihumiditylist(
                                                                    (WeatherCall.humlist(
                                                                      containerWeatherResponse
                                                                          .jsonBody,
                                                                    ) as List)
                                                                        .map<String>((s) => s.toString())
                                                                        .toList()
                                                                        ?.map((e) => e.toString())
                                                                        .toList()
                                                                        ?.toList(),
                                                                    0),
                                                                '0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'dw2729br' /* % */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FaIcon(
                                                            FontAwesomeIcons
                                                                .wind,
                                                            color: Color(
                                                                0xFF31C9FF),
                                                            size: 24.0,
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions.apispeedlist(
                                                                  (WeatherCall.speedlist(
                                                                    containerWeatherResponse
                                                                        .jsonBody,
                                                                  ) as List)
                                                                      .map<String>((s) => s.toString())
                                                                      .toList()
                                                                      ?.map((e) => e.toString())
                                                                      .toList()
                                                                      ?.toList(),
                                                                  0),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'o6k4qgjr' /* m/s */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          wrapWithModel(
                            model: _model.setLocationModel,
                            updateCallback: () => setState(() {}),
                            child: SetLocationWidget(),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 4.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'g3pft3vy' /* List of devices */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 18.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: StreamBuilder<List<DevicesRecord>>(
                              stream: queryDevicesRecord(
                                queryBuilder: (devicesRecord) =>
                                    devicesRecord.where('idPlat',
                                        isEqualTo:
                                            listDeviceDetailsPlatformsRecord
                                                .reference),
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
                                List<DevicesRecord> gridViewDevicesRecordList =
                                    snapshot.data!;

                                return GridView.builder(
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

                                          if (snapshot.data == null) {
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
                                                    ? Color.fromARGB(
                                                        255, 143, 180, 58)
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
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()
                                                        .map(
                                                            (e) => e.toString())
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
                                                        padding: MediaQuery.of(
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
                                                                    gridViewDevicesRecord
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
                                                                      ? FlutterFlowTheme.of(context).textColor
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
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: functions.apiListClient(
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
                                                              ? Color.fromARGB(255, 100, 99, 99)
                                                              : Color.fromARGB(100, 255, 0, 0),
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
