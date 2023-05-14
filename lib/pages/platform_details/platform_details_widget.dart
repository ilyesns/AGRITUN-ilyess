import '../../auth/auth_util.dart';
import '../../backend/api_requests/api_calls.dart';
import '../../backend/api_requests/api_manager.dart';
import '../../components/pop_updp/pop_updp_widget.dart';
import '../../components/share_user/share_user_widget.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/edit_device/edit_device_widget.dart';
import '/components/location_card_platform/location_card_platform_widget.dart';
import '/components/popupwarning/popupwarning_widget.dart';
import '../../tools/icon_button.dart';
import '../../tools/theme.dart';
import '../../tools/util.dart';
import '../../tools/widgets.dart';
import '/tools/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'platform_details_model.dart';
export 'platform_details_model.dart';
import '/tools/custom_functions.dart' as functions;

class PlatformDetailsWidget extends StatefulWidget {
  const PlatformDetailsWidget({
    Key? key,
    this.platformDetails,
  }) : super(key: key);

  final DocumentReference? platformDetails;

  @override
  _PlatformDetailsWidgetState createState() => _PlatformDetailsWidgetState();
}

class _PlatformDetailsWidgetState extends State<PlatformDetailsWidget> {
  late PlatformDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlatformDetailsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'platformDetails'});
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
      stream: PlatformsRecord.getDocument(
        widget.platformDetails!,
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
        final platformRecord = snapshot.data!;
        return Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondary,
                      ),
                      child: Padding(
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
                                    size: 25, color: Colors.white),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText('fozmzu8u'),
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                      color: Colors.white,
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineLargeFamily),
                            ),
                            SizedBox(
                              width: 25,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 650,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 15, left: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width > 500
                                  ? 500
                                  : MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () async {
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
                                            padding: MediaQuery.of(
                                                    bottomSheetContext)
                                                .viewInsets,
                                            child: PopUpdpWidget(
                                              idPlat: widget.platformDetails,
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                    child: Container(
                                      width: 85,
                                      height: 85,
                                      decoration: BoxDecoration(
                                        color: Colors.white24,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(31),
                                          topRight: Radius.circular(31),
                                          bottomLeft: Radius.circular(31),
                                          bottomRight: Radius.circular(31),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add_circle_outlined,
                                              size: 28, color: Colors.white),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            FFLocalizations.of(context)
                                                .getText('qodx4inp'),
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                    fontFamily: FlutterFlowTheme
                                                            .of(context)
                                                        .headlineSmallFamily,
                                                    color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'PLATFORM_DETAILS_Button-Login_ON_TAP');
                                      logFirebaseEvent(
                                          'Button-Login_upload_media_to_firebase');
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        allowPhoto: true,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];
                                        var downloadUrls = <String>[];
                                        try {
                                          showUploadMessage(
                                            context,
                                            'Uploading file...',
                                            showLoading: true,
                                          );
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                  ))
                                              .toList();

                                          downloadUrls = (await Future.wait(
                                            selectedMedia.map(
                                              (m) async => await uploadData(
                                                  m.storagePath, m.bytes),
                                            ),
                                          ))
                                              .where((u) => u != null)
                                              .map((u) => u!)
                                              .toList();
                                        } finally {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          _model.isDataUploading = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedMedia.length &&
                                            downloadUrls.length ==
                                                selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl =
                                                downloadUrls.first;
                                          });
                                          showUploadMessage(
                                              context, 'Success!');
                                        } else {
                                          setState(() {});
                                          showUploadMessage(
                                              context, 'Failed to upload data');
                                          return;
                                        }
                                      }

                                      logFirebaseEvent(
                                          'Button-Login_backend_call');

                                      final platformsUpdateData =
                                          createPlatformsRecordData(
                                        image: _model.uploadedFileUrl,
                                      );
                                      await widget.platformDetails!
                                          .update(platformsUpdateData);
                                    },
                                    child: Container(
                                      width: 85,
                                      height: 85,
                                      decoration: BoxDecoration(
                                        color: Colors.white24,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(31),
                                          topRight: Radius.circular(31),
                                          bottomLeft: Radius.circular(31),
                                          bottomRight: Radius.circular(31),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.image_rounded,
                                              size: 28, color: Colors.white),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            FFLocalizations.of(context)
                                                .getText('5w8b37zx'),
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                    fontFamily: FlutterFlowTheme
                                                            .of(context)
                                                        .headlineSmallFamily,
                                                    color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'PLATFORM_DETAILS_SET_LOCATION_BTN_ON_TAP');

                                      logFirebaseEvent('Button_bottom_sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: true,
                                        context: context,
                                        builder: (bottomSheetContext) {
                                          return Padding(
                                            padding: MediaQuery.of(
                                                    bottomSheetContext)
                                                .viewInsets,
                                            child: LocationCardPlatformWidget(
                                              platformRef:
                                                  widget.platformDetails,
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                    child: Container(
                                      width: 85,
                                      height: 85,
                                      decoration: BoxDecoration(
                                        color: Colors.white24,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(31),
                                          topRight: Radius.circular(31),
                                          bottomLeft: Radius.circular(31),
                                          bottomRight: Radius.circular(31),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add_location_rounded,
                                              size: 28, color: Colors.white),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            FFLocalizations.of(context)
                                                .getText('jgmzgl45'),
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                    fontFamily: FlutterFlowTheme
                                                            .of(context)
                                                        .headlineSmallFamily,
                                                    color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: true,
                                        context: context,
                                        builder: (bottomSheetContext) {
                                          return Padding(
                                            padding: MediaQuery.of(
                                                    bottomSheetContext)
                                                .viewInsets,
                                            child: ShareUserWidget(
                                              idplat: platformRecord.ffRef,
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                    child: Container(
                                      width: 85,
                                      height: 85,
                                      decoration: BoxDecoration(
                                        color: Colors.white24,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(31),
                                          topRight: Radius.circular(31),
                                          bottomLeft: Radius.circular(31),
                                          bottomRight: Radius.circular(31),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.share_rounded,
                                              size: 28, color: Colors.white),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            FFLocalizations.of(context)
                                                .getText('dw2729br'),
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                    fontFamily: FlutterFlowTheme
                                                            .of(context)
                                                        .headlineSmallFamily,
                                                    color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 20.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width > 500
                                      ? 500
                                      : MediaQuery.of(context).size.width,
                                  child: TextFormField(
                                    controller:
                                        _model.platformnameController ??=
                                            TextEditingController(
                                      text: platformRecord.platName,
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20.0, 24.0, 0.0, 24.0),
                                      suffixIcon: Icon(
                                        Icons.edit_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 22.0,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    validator: _model
                                        .platformnameControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context)
                                      .getText('fozmzu8i'),
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
                              height: 15,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width > 500
                                  ? 500
                                  : MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 20.0, 10.0, 0.0),
                                child: StreamBuilder<List<DevicesRecord>>(
                                  stream: queryDevicesRecord(
                                    queryBuilder: (devicesRecord) =>
                                        devicesRecord.where('idPlat',
                                            isEqualTo: widget.platformDetails),
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
                                        columnDevicesRecordList =
                                        snapshot.data!;
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          columnDevicesRecordList.length,
                                          (columnIndex) {
                                        final columnDevicesRecord =
                                            columnDevicesRecordList[
                                                columnIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 15.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                columnDevicesRecord.devName!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'PLATFORM_DETAILS_Icon_dx07x9e6_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_bottom_sheet');
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      barrierColor:
                                                          Color(0x00000000),
                                                      context: context,
                                                      builder:
                                                          (bottomSheetContext) {
                                                        return Padding(
                                                          padding: MediaQuery.of(
                                                                  bottomSheetContext)
                                                              .viewInsets,
                                                          child:
                                                              EditDeviceWidget(
                                                            idDevice:
                                                                columnDevicesRecord
                                                                    .reference,
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  },
                                                  child: Icon(
                                                    Icons.settings,
                                                    color: Colors.white,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 20,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 28.0, 0.0, 36.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Color(0x00000000),
                                      enableDrag: true,
                                      context: context,
                                      builder: (bottomSheetContext) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(bottomSheetContext)
                                                  .viewInsets,
                                          child: PopupwarningWidget(
                                            idplat: platformRecord.reference,
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'r5tk24oi' /* Delete */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 150.0,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).error,
                                    textStyle:
                                        FlutterFlowTheme.of(context).titleSmall,
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 28.0, 0.0, 36.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final platformsUpdateData =
                                        createPlatformsRecordData(
                                            platName: _model
                                                .platformnameController.text);
                                    await widget.platformDetails!
                                        .update(platformsUpdateData);

                                    context.pop();
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'r5tk24oy' /* Confirm */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 150.0,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    textStyle:
                                        FlutterFlowTheme.of(context).titleSmall,
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
