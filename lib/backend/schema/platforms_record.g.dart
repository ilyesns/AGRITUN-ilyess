// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platforms_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PlatformsRecord> _$platformsRecordSerializer =
    new _$PlatformsRecordSerializer();

class _$PlatformsRecordSerializer
    implements StructuredSerializer<PlatformsRecord> {
  @override
  final Iterable<Type> types = const [PlatformsRecord, _$PlatformsRecord];
  @override
  final String wireName = 'PlatformsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PlatformsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.idUser;
    if (value != null) {
      result
        ..add('idUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.platName;
    if (value != null) {
      result
        ..add('platName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createTime;
    if (value != null) {
      result
        ..add('createTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  PlatformsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlatformsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'idUser':
          result.idUser = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'platName':
          result.platName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'createTime':
          result.createTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$PlatformsRecord extends PlatformsRecord {
  @override
  final DocumentReference<Object?>? idUser;
  @override
  final String? platName;
  @override
  final DateTime? createTime;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PlatformsRecord([void Function(PlatformsRecordBuilder)? updates]) =>
      (new PlatformsRecordBuilder()..update(updates))._build();

  _$PlatformsRecord._({this.idUser, this.platName, this.createTime, this.ffRef})
      : super._();

  @override
  PlatformsRecord rebuild(void Function(PlatformsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlatformsRecordBuilder toBuilder() =>
      new PlatformsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PlatformsRecord &&
        idUser == other.idUser &&
        platName == other.platName &&
        createTime == other.createTime &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, idUser.hashCode);
    _$hash = $jc(_$hash, platName.hashCode);
    _$hash = $jc(_$hash, createTime.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PlatformsRecord')
          ..add('idUser', idUser)
          ..add('platName', platName)
          ..add('createTime', createTime)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PlatformsRecordBuilder
    implements Builder<PlatformsRecord, PlatformsRecordBuilder> {
  _$PlatformsRecord? _$v;

  DocumentReference<Object?>? _idUser;
  DocumentReference<Object?>? get idUser => _$this._idUser;
  set idUser(DocumentReference<Object?>? idUser) => _$this._idUser = idUser;

  String? _platName;
  String? get platName => _$this._platName;
  set platName(String? platName) => _$this._platName = platName;

  DateTime? _createTime;
  DateTime? get createTime => _$this._createTime;
  set createTime(DateTime? createTime) => _$this._createTime = createTime;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PlatformsRecordBuilder() {
    PlatformsRecord._initializeBuilder(this);
  }

  PlatformsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _idUser = $v.idUser;
      _platName = $v.platName;
      _createTime = $v.createTime;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PlatformsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PlatformsRecord;
  }

  @override
  void update(void Function(PlatformsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PlatformsRecord build() => _build();

  _$PlatformsRecord _build() {
    final _$result = _$v ??
        new _$PlatformsRecord._(
            idUser: idUser,
            platName: platName,
            createTime: createTime,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint