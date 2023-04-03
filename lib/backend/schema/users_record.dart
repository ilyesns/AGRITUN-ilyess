import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  String? get email;

  String? get password;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  String? get uid;

  @BuiltValueField(wireName: 'type_user')
  String? get typeUser;

  LatLng? get location;

  String? get age;

  @BuiltValueField(wireName: 'mqtt_client')
  bool? get mqttClient;

  String? get token;

  DocumentReference? get chattingwith;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..displayName = ''
    ..email = ''
    ..password = ''
    ..phoneNumber = ''
    ..photoUrl = ''
    ..uid = ''
    ..typeUser = ''
    ..age = ''
    ..mqttClient = false
    ..token = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? displayName,
  String? email,
  String? password,
  String? phoneNumber,
  String? photoUrl,
  DateTime? createdTime,
  String? uid,
  String? typeUser,
  LatLng? location,
  String? age,
  bool? mqttClient,
  String? token,
  DocumentReference? chattingwith,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..displayName = displayName
        ..email = email
        ..password = password
        ..phoneNumber = phoneNumber
        ..photoUrl = photoUrl
        ..createdTime = createdTime
        ..uid = uid
        ..typeUser = typeUser
        ..location = location
        ..age = age
        ..mqttClient = mqttClient
        ..token = token
        ..chattingwith = chattingwith,
    ),
  );

  return firestoreData;
}
