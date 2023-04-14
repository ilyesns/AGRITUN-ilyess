import 'dart:async';

import 'package:built_value/standard_json_plugin.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'yd_record.g.dart';

abstract class YdRecord implements Built<YdRecord, YdRecordBuilder> {
  static Serializer<YdRecord> get serializer => _$ydRecordSerializer;

  @BuiltValueField(wireName: 'sn_device')
  String? get snDevice;

  @BuiltValueField(wireName: 'Topic')
  String? get topic;

  @BuiltValueField(wireName: 'YFP')
  String? get yfp;

  @BuiltValueField(wireName: 'IDF')
  String? get idf;

  @BuiltValueField(wireName: 'POWERS')
  Map<String, String>? get powers;

  @BuiltValueField(wireName: 'Wifi')
  Map<String, dynamic>? get wifi;

  @BuiltValueField(wireName: 'ENERGY')
  Map<String, dynamic>? get energy;

  @BuiltValueField(wireName: 'Uptime')
  String? get uptime;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(YdRecordBuilder builder) => builder
    ..snDevice = ''
    ..topic = ''
    ..yfp = ''
    ..idf = ''
    ..powers = {}
    ..wifi = {}
    ..uptime = ''
    ..energy = {};

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('YD');

  static Stream<YdRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<YdRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  YdRecord._();
  factory YdRecord([void Function(YdRecordBuilder) updates]) = _$YdRecord;

  static YdRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createYdRecordData({
  String? snDevice,
  String? topic,
  String? yfp,
  String? idf,
}) {
  final firestoreData = serializers.toFirestore(
    YdRecord.serializer,
    YdRecord(
      (y) => y
        ..snDevice = snDevice
        ..topic = topic
        ..yfp = yfp
        ..idf = idf
        ..powers = null
        ..wifi = null,
    ),
  );

  return firestoreData;
}
