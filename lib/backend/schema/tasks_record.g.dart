// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TasksRecord> _$tasksRecordSerializer = new _$TasksRecordSerializer();

class _$TasksRecordSerializer implements StructuredSerializer<TasksRecord> {
  @override
  final Iterable<Type> types = const [TasksRecord, _$TasksRecord];
  @override
  final String wireName = 'TasksRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TasksRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.taskName;
    if (value != null) {
      result
        ..add('task_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tsCreateTime;
    if (value != null) {
      result
        ..add('ts_create_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.tsStartTime;
    if (value != null) {
      result
        ..add('ts_start_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.idUser;
    if (value != null) {
      result
        ..add('id_user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  TasksRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TasksRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'task_name':
          result.taskName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ts_create_time':
          result.tsCreateTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'ts_start_time':
          result.tsStartTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'id_user':
          result.idUser = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$TasksRecord extends TasksRecord {
  @override
  final String? taskName;
  @override
  final DateTime? tsCreateTime;
  @override
  final DateTime? tsStartTime;
  @override
  final DocumentReference<Object?>? idUser;
  @override
  final String? description;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TasksRecord([void Function(TasksRecordBuilder)? updates]) =>
      (new TasksRecordBuilder()..update(updates))._build();

  _$TasksRecord._(
      {this.taskName,
      this.tsCreateTime,
      this.tsStartTime,
      this.idUser,
      this.description,
      this.ffRef})
      : super._();

  @override
  TasksRecord rebuild(void Function(TasksRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TasksRecordBuilder toBuilder() => new TasksRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TasksRecord &&
        taskName == other.taskName &&
        tsCreateTime == other.tsCreateTime &&
        tsStartTime == other.tsStartTime &&
        idUser == other.idUser &&
        description == other.description &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, taskName.hashCode);
    _$hash = $jc(_$hash, tsCreateTime.hashCode);
    _$hash = $jc(_$hash, tsStartTime.hashCode);
    _$hash = $jc(_$hash, idUser.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TasksRecord')
          ..add('taskName', taskName)
          ..add('tsCreateTime', tsCreateTime)
          ..add('tsStartTime', tsStartTime)
          ..add('idUser', idUser)
          ..add('description', description)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TasksRecordBuilder implements Builder<TasksRecord, TasksRecordBuilder> {
  _$TasksRecord? _$v;

  String? _taskName;
  String? get taskName => _$this._taskName;
  set taskName(String? taskName) => _$this._taskName = taskName;

  DateTime? _tsCreateTime;
  DateTime? get tsCreateTime => _$this._tsCreateTime;
  set tsCreateTime(DateTime? tsCreateTime) =>
      _$this._tsCreateTime = tsCreateTime;

  DateTime? _tsStartTime;
  DateTime? get tsStartTime => _$this._tsStartTime;
  set tsStartTime(DateTime? tsStartTime) => _$this._tsStartTime = tsStartTime;

  DocumentReference<Object?>? _idUser;
  DocumentReference<Object?>? get idUser => _$this._idUser;
  set idUser(DocumentReference<Object?>? idUser) => _$this._idUser = idUser;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TasksRecordBuilder() {
    TasksRecord._initializeBuilder(this);
  }

  TasksRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _taskName = $v.taskName;
      _tsCreateTime = $v.tsCreateTime;
      _tsStartTime = $v.tsStartTime;
      _idUser = $v.idUser;
      _description = $v.description;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TasksRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TasksRecord;
  }

  @override
  void update(void Function(TasksRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TasksRecord build() => _build();

  _$TasksRecord _build() {
    final _$result = _$v ??
        new _$TasksRecord._(
            taskName: taskName,
            tsCreateTime: tsCreateTime,
            tsStartTime: tsStartTime,
            idUser: idUser,
            description: description,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
