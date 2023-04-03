// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class IconWeather extends StatefulWidget {
  const IconWeather({
    Key? key,
    this.width,
    this.height,
    this.api,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? api;

  @override
  _IconWeatherState createState() => _IconWeatherState();
}

class _IconWeatherState extends State<IconWeather> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Image.network(
        "https://openweathermap.org/img/w/${widget.api}.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
