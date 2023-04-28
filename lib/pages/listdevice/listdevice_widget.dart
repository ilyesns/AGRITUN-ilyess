import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../auth/auth_util.dart';

import '/backend/backend.dart';
import '/components/addplatform/addplatform_widget.dart';
import '/components/device_details_widget.dart';
import '/components/empty_platform_dev/empty_platform_dev_widget.dart';
import '/components/empty_platform_list/empty_platform_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
            builder: (bottomSheetContext) {
              return Padding(
                padding: MediaQuery.of(bottomSheetContext).viewInsets,
                child: AddplatformWidget(),
              );
            },
          ).then((value) => setState(() {}));
        },
        backgroundColor: FlutterFlowTheme.of(context).primary,
        elevation: 8,
        child: Icon(
          Icons.add_rounded,
          color: FlutterFlowTheme.of(context).textColor,
          size: 36,
        ),
      ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            'bz111zc4' /* Devices */,
          ),
          style: FlutterFlowTheme.of(context).displaySmall.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Container(
            width: 500,
            decoration: BoxDecoration(
              color: Color(0x00FFFFFF),
            ),
            child: StreamBuilder<List<PlatformsRecord>>(
              stream: queryPlatformsRecord(
                queryBuilder: (platformsRecord) =>
                    platformsRecord.where("users", arrayContainsAny: [
                  {"idUser": currentUserReference, "owner": false},
                  {"idUser": currentUserReference, "owner": true},
                ]),
              ),
              /*
              */
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
                List<PlatformsRecord> gridViewPlatformsRecordList =
                    snapshot.data!;
                if (gridViewPlatformsRecordList.isEmpty) {
                  return Center(
                    child: Container(
                      height: 500,
                      child: EmptyPlatformListWidget(),
                    ),
                  );
                }
                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: gridViewPlatformsRecordList.length,
                  itemBuilder: (context, gridViewIndex) {
                    final gridViewPlatformsRecord =
                        gridViewPlatformsRecordList[gridViewIndex];

                    bool isShared = false;

                    gridViewPlatformsRecord.users!.forEach((element) {
                      if (element["owner"] == false &&
                          element["idUser"] == currentUserReference) {
                        isShared = true;
                      }
                    });

                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                      child: Material(
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: gridViewPlatformsRecord.image !=
                                              null &&
                                          gridViewPlatformsRecord.image != ""
                                      ? Image.network(gridViewPlatformsRecord
                                              .image as String)
                                          .image
                                      : Image.asset('assets/images/farm_2.jpg')
                                          .image)),
                          child: Stack(children: [
                            if (isShared)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.six_ft_apart_sharp,
                                      color: Colors.deepOrangeAccent,
                                      size: 30,
                                    )
                                  ],
                                ),
                              ),
                            Container(
                              width: MediaQuery.of(context).size.width * 1.8,
                              height: MediaQuery.of(context).size.height * 2,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(40, 9, 1, 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(7, 13, 7, 7),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'LISTDEVICE_PAGE_padding_ON_TAP');
                                    logFirebaseEvent('padding_navigate_to');

                                    context.pushNamed(
                                      'listDeviceDetails',
                                      queryParams: {
                                        'platformRef': serializeParam(
                                          gridViewPlatformsRecord.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 7, 0, 0),
                                        child: Text(
                                          gridViewPlatformsRecord.platName!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 7, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FutureBuilder<int>(
                                              future: queryDevicesRecordCount(
                                                queryBuilder: (devicesRecord) =>
                                                    devicesRecord.where(
                                                        'idPlat',
                                                        isEqualTo:
                                                            gridViewPlatformsRecord
                                                                .reference),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Text(
                                                    "0",
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  );
                                                }
                                                int textCount = snapshot.data!;

                                                return Text(
                                                  textCount.toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                );
                                              },
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(3, 0, 0, 0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'pqq4yvjz' /* devices */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
