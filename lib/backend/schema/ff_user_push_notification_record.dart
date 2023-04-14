import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'ff_user_push_notification_record.g.dart';

abstract class FfUserPushNotificationRecord
    implements
        Built<FfUserPushNotificationRecord,
            FfUserPushNotificationRecordBuilder> {
  static Serializer<FfUserPushNotificationRecord> get serializer =>
      _$ffUserPushNotificationRecordSerializer;

  @BuiltValueField(wireName: 'notification_text')
  String? get notificationText;

  @BuiltValueField(wireName: 'notification_title')
  String? get notificationTitle;

  String? get devname;

  String? get platname;

  DocumentReference? get sender;

  DateTime? get timestamp;

  bool? get marked;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FfUserPushNotificationRecordBuilder builder) =>
      builder
        ..notificationText = ''
        ..notificationTitle = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ff_user_push_notifications');

  static Stream<FfUserPushNotificationRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FfUserPushNotificationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FfUserPushNotificationRecord._();
  factory FfUserPushNotificationRecord(
          [void Function(FfUserPushNotificationRecordBuilder) updates]) =
      _$FfUserPushNotificationRecord;

  static FfUserPushNotificationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFfUserPushNotificationRecordData({
  String? notificationText,
  String? notificationTitle,
  DocumentReference? sender,
  DateTime? timestamp,
  bool? marked,
}) {
  final firestoreData = serializers.toFirestore(
    FfUserPushNotificationRecord.serializer,
    FfUserPushNotificationRecord(
      (f) => f
        ..notificationText = notificationText
        ..notificationTitle = notificationTitle
        ..sender = sender
        ..marked = marked
        ..timestamp = timestamp,
    ),
  );

  return firestoreData;
}
