import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import '../cloud_functions/cloud_functions.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class WeatherCall {
  static Future<ApiCallResponse> call({
    String? lat = '',
    String? lon = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'WeatherCall',
        'variables': {
          'lat': lat,
          'lon': lon,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic cityname(dynamic response) => getJsonField(
        response,
        r'''$.city.name''',
      );
  static dynamic weather(dynamic response) => getJsonField(
        response,
        r'''$.list[:].weather''',
        true,
      );
  static dynamic iconlist(dynamic response) => getJsonField(
        response,
        r'''$.list[:].weather[:].icon''',
        true,
      );
  static dynamic datelist(dynamic response) => getJsonField(
        response,
        r'''$.list[:].dt_txt''',
        true,
      );
  static dynamic templist(dynamic response) => getJsonField(
        response,
        r'''$.list[:].main.temp''',
        true,
      );
  static dynamic humlist(dynamic response) => getJsonField(
        response,
        r'''$.list[:].main.humidity''',
        true,
      );
  static dynamic speedlist(dynamic response) => getJsonField(
        response,
        r'''$.list[:].wind.speed''',
        true,
      );
  static dynamic visibilitylist(dynamic response) => getJsonField(
        response,
        r'''$.list[:].visibility''',
        true,
      );
}

class MqttApiListClientCall {
  static Future<ApiCallResponse> call({
    String? payload = '',
    String? snDevice = '',
    String? cmnd = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'MqttApiListClientCall',
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic listclient(dynamic response) => getJsonField(
        response,
        r'''$.data[:].clientid''',
        true,
      );
}

class MqttApiSendCmdCall {
  static Future<ApiCallResponse> call({
    String? payload = '',
    String? snDevice = '',
    String? cmnd = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'MqttApiSendCmdCall',
        'variables': {
          'payload': payload,
          'snDevice': snDevice,
          'cmnd': cmnd,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
