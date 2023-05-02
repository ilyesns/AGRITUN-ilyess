import 'package:flutter/material.dart';
import 'package:yagri/tools/theme.dart';

class HumidityTreeWidget extends StatefulWidget {
  double humidity = 0.0;
  Color leafColor = Colors.yellow;
  String title = "Humidity";
  HumidityTreeWidget(
      {required this.humidity, required this.leafColor, required this.title});

  @override
  _HumidityTreeWidgetState createState() => _HumidityTreeWidgetState();
}

class _HumidityTreeWidgetState extends State<HumidityTreeWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                top: 12,
                right: 53,
                child: Container(
                  width: 20,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        bottomRight: Radius.circular(70)),
                    color: widget.leafColor,
                  ),
                ),
              ),
              Positioned(
                top: 24,
                right: 41,
                child: Container(
                  width: 30,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        bottomRight: Radius.circular(60)),
                    color: widget.leafColor,
                  ),
                ),
              ),
              Positioned(
                top: 45,
                right: 20,
                child: Container(
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        bottomRight: Radius.circular(55)),
                    color: widget.leafColor,
                  ),
                ),
              ),
              Positioned(
                bottom: 33,
                right: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 10, top: 150),
                  width: 70,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        bottomRight: Radius.circular(55)),
                    color: widget.leafColor,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                child: Container(
                  height: 100,
                  width: 10,
                  color: Colors.brown,
                ),
              ),
              Positioned(
                bottom: 33,
                left: -9.7,
                child: Container(
                  margin: EdgeInsets.only(left: 10, top: 150),
                  width: 70,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(70),
                        bottomLeft: Radius.circular(55)),
                    color: widget.leafColor,
                  ),
                ),
              ),
              Positioned(
                top: 45,
                left: 20,
                child: Container(
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(70),
                        bottomLeft: Radius.circular(55)),
                    color: widget.leafColor,
                  ),
                ),
              ),
              Positioned(
                top: 24,
                left: 40,
                child: Container(
                  width: 30,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(70),
                        bottomLeft: Radius.circular(60)),
                    color: widget.leafColor,
                  ),
                ),
              ),
              Positioned(
                top: 12,
                left: 53,
                child: Container(
                  width: 20,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(70),
                        bottomLeft: Radius.circular(70)),
                    color: widget.leafColor,
                  ),
                ),
              ),
              Positioned(
                bottom: 3,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.brown,
                  ),
                  child: Center(
                      child: Text(
                    "${widget.humidity} %",
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          color: Colors.white,
                          fontFamily: "Outfit",
                        ),
                  )),
                ),
              ),
            ],
          ),
        ),
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
