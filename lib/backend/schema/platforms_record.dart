import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'platforms_record.g.dart';

abstract class PlatformsRecord
    implements Built<PlatformsRecord, PlatformsRecordBuilder> {
  static Serializer<PlatformsRecord> get serializer =>
      _$platformsRecordSerializer;

  DocumentReference? get idUser;

  String? get platName;

  DateTime? get createTime;

  LatLng? get location;

  String? get image;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PlatformsRecordBuilder builder) => builder
    ..platName = ''
    ..image = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('platforms');

  static Stream<PlatformsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PlatformsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PlatformsRecord._();
  factory PlatformsRecord([void Function(PlatformsRecordBuilder) updates]) =
      _$PlatformsRecord;

  static PlatformsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPlatformsRecordData({
  DocumentReference? idUser,
  String? platName,
  DateTime? createTime,
  LatLng? location,
  String? image,
}) {
  final firestoreData = serializers.toFirestore(
    PlatformsRecord.serializer,
    PlatformsRecord(
      (p) => p
        ..idUser = idUser
        ..platName = platName
        ..createTime = createTime
        ..location = location
        ..image = image,
    ),
  );

  return firestoreData;
}
