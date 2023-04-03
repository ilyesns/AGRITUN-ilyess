import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tasks_record.g.dart';

abstract class TasksRecord implements Built<TasksRecord, TasksRecordBuilder> {
  static Serializer<TasksRecord> get serializer => _$tasksRecordSerializer;

  @BuiltValueField(wireName: 'task_name')
  String? get taskName;

  @BuiltValueField(wireName: 'ts_create_time')
  DateTime? get tsCreateTime;

  @BuiltValueField(wireName: 'ts_start_time')
  DateTime? get tsStartTime;

  @BuiltValueField(wireName: 'id_user')
  DocumentReference? get idUser;

  String? get description;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(TasksRecordBuilder builder) => builder
    ..taskName = ''
    ..description = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tasks')
          : FirebaseFirestore.instance.collectionGroup('tasks');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('tasks').doc();

  static Stream<TasksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TasksRecord._();
  factory TasksRecord([void Function(TasksRecordBuilder) updates]) =
      _$TasksRecord;

  static TasksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTasksRecordData({
  String? taskName,
  DateTime? tsCreateTime,
  DateTime? tsStartTime,
  DocumentReference? idUser,
  String? description,
}) {
  final firestoreData = serializers.toFirestore(
    TasksRecord.serializer,
    TasksRecord(
      (t) => t
        ..taskName = taskName
        ..tsCreateTime = tsCreateTime
        ..tsStartTime = tsStartTime
        ..idUser = idUser
        ..description = description,
    ),
  );

  return firestoreData;
}
