import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

// Chat gpt function
dynamic saveChatHistory(
  dynamic chatHistory,
  dynamic newChat,
) {
  // If chatHistory isn't a list, make it a list and then add newChat
  print(chatHistory);
  print(newChat);
  if (chatHistory is List) {
    chatHistory.add(newChat);
    return chatHistory;
  } else {
    return [newChat];
  }
}

dynamic convertToJSON(String prompt) {
  // take the prompt and return a JSON with form [{"role": "user", "content": prompt}]
  return json.decode('{"role": "user", "content": "$prompt"}');
}

// Chat gpt function End

String latitude(LatLng? userLocation) {
  // Add your function code here!
  if (userLocation != null) {
    return '${(userLocation.latitude)}';
  } else {
    return '';
  }
}

String longitude(LatLng? userLocation) {
  // Add your function code here!
  if (userLocation != null) {
    return '${(userLocation.longitude)}';
  } else {
    return '';
  }
}

String apidatelist(
  List<String>? datelist,
  int? element,
) {
  return datelist![element!].substring(11, 16);
}

String apitemplist(
  List<String>? templist,
  int? element,
) {
  return templist![element!];
}

String apiconlist(
  List<String>? iconlist,
  int? element,
) {
  return iconlist![element!];
}

String apispeedlist(
  List<String>? speedlist,
  int? element,
) {
  return speedlist![element!].toString();
}

String apihumiditylist(
  List<String>? humiditylist,
  int? element,
) {
  return humiditylist![element!].toString();
}

String apivislist(
  List<String> listvisl,
  int element,
) {
  return listvisl[element].toString().substring(0, 2);
}

String userUidsubstring(String userUid) {
  return userUid.substring(0, 10);
}

bool? apiListClient(
  String? idDevice,
  List<dynamic>? listclient,
) {
  return listclient!.contains(idDevice);
}
