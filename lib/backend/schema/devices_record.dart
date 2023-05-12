import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'devices_record.g.dart';

abstract class DevicesRecord
    implements Built<DevicesRecord, DevicesRecordBuilder> {
  static Serializer<DevicesRecord> get serializer => _$devicesRecordSerializer;

  DocumentReference? get idPlat;

  String? get sn_device;

  String? get devName;

  bool? get status;

  DateTime? get createTime;

  String? get type;

  DocumentReference? get idUser;

  BuiltList<DocumentReference>? get users;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DevicesRecordBuilder builder) => builder
    ..sn_device = ''
    ..devName = ''
    ..status = false
    ..type = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('devices');

  static Stream<DevicesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DevicesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DevicesRecord._();
  factory DevicesRecord([void Function(DevicesRecordBuilder) updates]) =
      _$DevicesRecord;

  static DevicesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDevicesRecordData({
  DocumentReference? idPlat,
  String? sn_device,
  String? devName,
  bool? status,
  DateTime? createTime,
  String? type,
  DocumentReference? idUser,
  BuiltList<DocumentReference>? users,
}) {
  final firestoreData = serializers.toFirestore(
    DevicesRecord.serializer,
    DevicesRecord(
      (d) => d
        ..idPlat = idPlat
        ..sn_device = sn_device
        ..devName = devName
        ..status = status
        ..createTime = createTime
        ..type = type
        ..idUser = idUser
        ..users = users,
    ),
  );

  return firestoreData;
}
