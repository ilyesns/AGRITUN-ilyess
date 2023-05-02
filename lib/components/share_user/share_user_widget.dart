import 'package:flutter/gestures.dart';
import 'package:yagri/components/share_user/qr_code_scanner.dart';

import '../../tools/widgets.dart';
import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '../../tools/theme.dart';
import '../../tools/util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'share_user_model.dart';
export 'share_user_model.dart';

class ShareUserWidget extends StatefulWidget {
  final PlatformsRecord? platformsRecord;

  const ShareUserWidget({
    Key? key,
    this.platformsRecord,
  }) : super(key: key);

  @override
  _ShareUserWidget createState() => _ShareUserWidget();
}

class _ShareUserWidget extends State<ShareUserWidget> {
  late ShareUserModel _model;
  TextEditingController searchController = TextEditingController();
  final searchFocusNode = FocusNode();
  String? result;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShareUserModel());

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
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Color.fromARGB(141, 14, 21, 27),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 500,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'x6vxicfz' /* Share a platform to user  */,
                            ),
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: searchController,
                            focusNode: searchFocusNode,
                            decoration: InputDecoration(
                              hintText: 'Email Address/Mobile Phone Number',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                result = null;
                              });
                            },
                          ),
                        ),
                        Text(
                          "Or :",
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final res = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QrCodeScanner()),
                            );
                            setState(() {
                              result = res;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.qr_code_scanner,
                                    size: 35,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Scan QR Code',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Icon(Icons.question_mark)
                                          ],
                                        ),
                                        Text(
                                          'Share platform via the QR cide if the recipient\'s account',
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                            width: 300,
                            child: StreamBuilder<List<UsersRecord>>(
                                stream: queryUsersRecord(),
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
                                  List<UsersRecord>? listViewUsersRecordList;

                                  listViewUsersRecordList = snapshot.data!
                                      .where((u) => u.uid != currentUserUid)
                                      .where((ele) {
                                    if (searchController.text != "") {
                                      if (searchController.text.contains('@')) {
                                        return ele.email ==
                                            searchController.text;
                                      } else {
                                        return ele.phoneNumber ==
                                            searchController.text;
                                      }
                                    } else {
                                      return false;
                                    }
                                  }).toList();
                                  if (result != null) {
                                    listViewUsersRecordList = snapshot.data!
                                        .where((u) => u.uid == result)
                                        .toList();
                                  }

                                  if (listViewUsersRecordList.isEmpty) {
                                    return Container();
                                  }

                                  final listViewUsersRecord =
                                      listViewUsersRecordList[0];
                                  return Container(
                                    width: 130,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("You want share with :",
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    if (listViewUsersRecord
                                                                .photoUrl !=
                                                            null &&
                                                        listViewUsersRecord
                                                                .photoUrl !=
                                                            '')
                                                      Container(
                                                        width: 30,
                                                        height: 30.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          listViewUsersRecord
                                                              .photoUrl!,
                                                        ),
                                                      ),
                                                    if (listViewUsersRecord
                                                                .photoUrl ==
                                                            null ||
                                                        listViewUsersRecord
                                                                .photoUrl ==
                                                            '')
                                                      Container(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.asset(
                                                          'assets/images/farmer.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        listViewUsersRecord
                                                            .displayName!,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                      if (listViewUsersRecord
                                                                  .typeUser !=
                                                              null &&
                                                          listViewUsersRecord
                                                                  .typeUser !=
                                                              '')
                                                        Text(
                                                          listViewUsersRecord
                                                              .typeUser!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      List<
                                                              Map<String,
                                                                  dynamic>>?
                                                          newUser = widget
                                                              .platformsRecord!
                                                              .users;

                                                      final exists = newUser!
                                                          .any((user) =>
                                                              user['idUser'] ==
                                                              listViewUsersRecord
                                                                  .ffRef);
                                                      if (!exists) {
                                                        newUser.add({
                                                          "idUser":
                                                              listViewUsersRecord
                                                                  .ffRef,
                                                          'owner': false
                                                        });

                                                        final createPlatformRecord =
                                                            createPlatformsRecordData(
                                                                users: newUser);
                                                        await widget
                                                            .platformsRecord!
                                                            .ffRef!
                                                            .update(
                                                                createPlatformRecord);
                                                      }
                                                      setState(() {});
                                                    },
                                                    text: 'Confirm',
                                                    options: FFButtonOptions(
                                                      width: 100.0,
                                                      height: 40.0,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                })),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Container(
                              width: 300,
                              height: 200,
                              child: StreamBuilder<List<UsersRecord>?>(
                                  stream: querUsersPlatformsRecord(
                                      id: widget.platformsRecord!.ffRef!),
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

                                    List<UsersRecord>? listViewUsersRecordList =
                                        snapshot.data!;

                                    if (snapshot.data == null) {
                                      return Container();
                                    }

                                    return ListView.builder(
                                      itemCount: listViewUsersRecordList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final listViewUsersRecord =
                                            listViewUsersRecordList[index];
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Container(
                                            width: 130,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("History Recipient :",
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            if (listViewUsersRecord
                                                                        .photoUrl !=
                                                                    null &&
                                                                listViewUsersRecord
                                                                        .photoUrl !=
                                                                    '')
                                                              Container(
                                                                width: 30,
                                                                height: 30.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  listViewUsersRecord
                                                                      .photoUrl!,
                                                                ),
                                                              ),
                                                            if (listViewUsersRecord
                                                                        .photoUrl ==
                                                                    null ||
                                                                listViewUsersRecord
                                                                        .photoUrl ==
                                                                    '')
                                                              Container(
                                                                width: 30.0,
                                                                height: 30.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/farmer.png',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                listViewUsersRecord
                                                                    .displayName!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                              if (listViewUsersRecord
                                                                          .typeUser !=
                                                                      null &&
                                                                  listViewUsersRecord
                                                                          .typeUser !=
                                                                      '')
                                                                Text(
                                                                  listViewUsersRecord
                                                                      .typeUser!,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              List<
                                                                      Map<String,
                                                                          dynamic>>?
                                                                  newUser =
                                                                  widget
                                                                      .platformsRecord!
                                                                      .users;

                                                              newUser!.removeWhere((item) =>
                                                                  item['idUser'] ==
                                                                      listViewUsersRecord
                                                                          .ffRef &&
                                                                  item['owner'] ==
                                                                      false);

                                                              final createPlatformRecord =
                                                                  createPlatformsRecordData(
                                                                      users:
                                                                          newUser);
                                                              await widget
                                                                  .platformsRecord!
                                                                  .ffRef!
                                                                  .update(
                                                                      createPlatformRecord);
                                                              setState(() {});
                                                            },
                                                            text: 'Remove',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 40.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                      ),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  })),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
   final listViewUsersRecord = 
                                  listViewUsersRecordList[0];
                                  
 */