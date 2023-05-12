// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DevicesRecord> _$devicesRecordSerializer =
    new _$DevicesRecordSerializer();

class _$DevicesRecordSerializer implements StructuredSerializer<DevicesRecord> {
  @override
  final Iterable<Type> types = const [DevicesRecord, _$DevicesRecord];
  @override
  final String wireName = 'DevicesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DevicesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.idPlat;
    if (value != null) {
      result
        ..add('idPlat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.sn_device;
    if (value != null) {
      result
        ..add('sn_device')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.devName;
    if (value != null) {
      result
        ..add('devName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.createTime;
    if (value != null) {
      result
        ..add('createTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.idUser;
    if (value != null) {
      result
        ..add('idUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.users;
    if (value != null) {
      result
        ..add('users')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
  DevicesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DevicesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'idPlat':
          result.idPlat = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'sn_device':
          result.sn_device = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'devName':
          result.devName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'createTime':
          result.createTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'idUser':
          result.idUser = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'users':
          Object deserializedList = serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))!;
          final list = new ListBuilder<DocumentReference<Object?>>();
          list.replace(
              deserializedList as BuiltList<DocumentReference<Object?>>);

          result.users = list.build();
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

class _$DevicesRecord extends DevicesRecord {
  @override
  final DocumentReference<Object?>? idPlat;
  @override
  final String? sn_device;
  @override
  final String? devName;
  @override
  final bool? status;
  @override
  final DateTime? createTime;
  @override
  final String? type;
  @override
  final DocumentReference<Object?>? idUser;
  @override
  final BuiltList<DocumentReference>? users;

  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DevicesRecord([void Function(DevicesRecordBuilder)? updates]) =>
      (new DevicesRecordBuilder()..update(updates))._build();

  _$DevicesRecord._(
      {this.idPlat,
      this.sn_device,
      this.devName,
      this.status,
      this.createTime,
      this.type,
      this.idUser,
      this.users,
      this.ffRef})
      : super._();

  @override
  DevicesRecord rebuild(void Function(DevicesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DevicesRecordBuilder toBuilder() => new DevicesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DevicesRecord &&
        idPlat == other.idPlat &&
        sn_device == other.sn_device &&
        devName == other.devName &&
        status == other.status &&
        createTime == other.createTime &&
        type == other.type &&
        idUser == other.idUser &&
        users == other.users &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, idPlat.hashCode);
    _$hash = $jc(_$hash, sn_device.hashCode);
    _$hash = $jc(_$hash, devName.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, createTime.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, idUser.hashCode);
    _$hash = $jc(_$hash, users.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DevicesRecord')
          ..add('idPlat', idPlat)
          ..add('sn_device', sn_device)
          ..add('devName', devName)
          ..add('status', status)
          ..add('createTime', createTime)
          ..add('type', type)
          ..add('idUser', idUser)
          ..add('users', users)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DevicesRecordBuilder
    implements Builder<DevicesRecord, DevicesRecordBuilder> {
  _$DevicesRecord? _$v;

  DocumentReference<Object?>? _idPlat;
  DocumentReference<Object?>? get idPlat => _$this._idPlat;
  set idPlat(DocumentReference<Object?>? idPlat) => _$this._idPlat = idPlat;

  String? _sn_device;
  String? get sn_device => _$this._sn_device;
  set sn_device(String? sn_device) => _$this._sn_device = sn_device;

  String? _devName;
  String? get devName => _$this._devName;
  set devName(String? devName) => _$this._devName = devName;

  bool? _status;
  bool? get status => _$this._status;
  set status(bool? status) => _$this._status = status;

  DateTime? _createTime;
  DateTime? get createTime => _$this._createTime;
  set createTime(DateTime? createTime) => _$this._createTime = createTime;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  DocumentReference<Object?>? _idUser;
  DocumentReference<Object?>? get idUser => _$this._idUser;
  set idUser(DocumentReference<Object?>? idUser) => _$this._idUser = idUser;

  BuiltList<DocumentReference>? _users;
  BuiltList<DocumentReference>? get users =>
      _$this._users ??= new BuiltList<DocumentReference>();
  set users(BuiltList<DocumentReference>? users) => _$this._users = users;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DevicesRecordBuilder() {
    DevicesRecord._initializeBuilder(this);
  }

  DevicesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _idPlat = $v.idPlat;
      _sn_device = $v.sn_device;
      _devName = $v.devName;
      _status = $v.status;
      _createTime = $v.createTime;
      _type = $v.type;
      _idUser = $v.idUser;
      _users = $v.users;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DevicesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DevicesRecord;
  }

  @override
  void update(void Function(DevicesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DevicesRecord build() => _build();

  _$DevicesRecord _build() {
    final _$result = _$v ??
        new _$DevicesRecord._(
            idPlat: idPlat,
            sn_device: sn_device,
            devName: devName,
            status: status,
            createTime: createTime,
            type: type,
            idUser: idUser,
            users: users,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
