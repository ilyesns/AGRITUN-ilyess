import '/components/add_device/add_device_widget.dart';
import '../../tools/theme.dart';
import '../../tools/util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_platform_dev_model.dart';
export 'empty_platform_dev_model.dart';

class EmptyPlatformDevWidget extends StatefulWidget {
  const EmptyPlatformDevWidget({
    Key? key,
    this.idPlatform,
  }) : super(key: key);

  final DocumentReference? idPlatform;

  @override
  _EmptyPlatformDevWidgetState createState() => _EmptyPlatformDevWidgetState();
}

class _EmptyPlatformDevWidgetState extends State<EmptyPlatformDevWidget> {
  late EmptyPlatformDevModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyPlatformDevModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
      child: InkWell(
        onTap: () async {
          logFirebaseEvent('EMPTY_PLATFORM_DEV_homeCard_Tasks_ON_TAP');
          logFirebaseEvent('homeCard_Tasks_bottom_sheet');
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            barrierColor: Color(0x00000000),
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: AddDeviceWidget(
                  idplat: widget.idPlatform,
                ),
              );
            },
          ).then((value) => setState(() {}));
        },
        child: Material(
          color: Colors.transparent,
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            width: 200.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 5.0, 0.0),
                    child: Icon(
                      Icons.devices,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      size: 30.0,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: 140,
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'bdwgpsd9' /* Add new device */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
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
  }
}
