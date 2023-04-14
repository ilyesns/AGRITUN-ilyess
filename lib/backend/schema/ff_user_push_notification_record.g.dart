// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ff_user_push_notification_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FfUserPushNotificationRecord>
    _$ffUserPushNotificationRecordSerializer =
    new _$FfUserPushNotificationRecordSerializer();

class _$FfUserPushNotificationRecordSerializer
    implements StructuredSerializer<FfUserPushNotificationRecord> {
  @override
  final Iterable<Type> types = const [
    FfUserPushNotificationRecord,
    _$FfUserPushNotificationRecord
  ];
  @override
  final String wireName = 'FfUserPushNotificationRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, FfUserPushNotificationRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.notificationText;
    if (value != null) {
      result
        ..add('notification_text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.notificationTitle;
    if (value != null) {
      result
        ..add('notification_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.devname;
    if (value != null) {
      result
        ..add('devName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.platname;
    if (value != null) {
      result
        ..add('platName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sender;
    if (value != null) {
      result
        ..add('sender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.timestamp;
    if (value != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.marked;
    if (value != null) {
      result
        ..add('marked')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  FfUserPushNotificationRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FfUserPushNotificationRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'notification_text':
          result.notificationText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'notification_title':
          result.notificationTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'devName':
          result.devname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'platName':
          result.platname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sender':
          result.sender = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'marked':
          result.marked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$FfUserPushNotificationRecord extends FfUserPushNotificationRecord {
  @override
  final String? notificationText;
  @override
  final String? notificationTitle;
  @override
  final DocumentReference<Object?>? sender;
  @override
  final DateTime? timestamp;
  @override
  final String? devname;
  @override
  final String? platname;
  @override
  final bool? marked;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FfUserPushNotificationRecord(
          [void Function(FfUserPushNotificationRecordBuilder)? updates]) =>
      (new FfUserPushNotificationRecordBuilder()..update(updates))._build();

  _$FfUserPushNotificationRecord._(
      {this.notificationText,
      this.notificationTitle,
      this.sender,
      this.timestamp,
      this.platname,
      this.marked,
      this.devname,
      this.ffRef})
      : super._();

  @override
  FfUserPushNotificationRecord rebuild(
          void Function(FfUserPushNotificationRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FfUserPushNotificationRecordBuilder toBuilder() =>
      new FfUserPushNotificationRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FfUserPushNotificationRecord &&
        notificationText == other.notificationText &&
        notificationTitle == other.notificationTitle &&
        sender == other.sender &&
        marked == other.marked &&
        devname == other.devname &&
        platname == other.platname &&
        timestamp == other.timestamp &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, notificationText.hashCode);
    _$hash = $jc(_$hash, notificationTitle.hashCode);
    _$hash = $jc(_$hash, sender.hashCode);
    _$hash = $jc(_$hash, platname.hashCode);
    _$hash = $jc(_$hash, timestamp.hashCode);
    _$hash = $jc(_$hash, marked.hashCode);
    _$hash = $jc(_$hash, devname.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FfUserPushNotificationRecord')
          ..add('notificationText', notificationText)
          ..add('notificationTitle', notificationTitle)
          ..add('platname', platname)
          ..add('sender', sender)
          ..add('timestamp', timestamp)
          ..add('marked', marked)
          ..add('devname', devname)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FfUserPushNotificationRecordBuilder
    implements
        Builder<FfUserPushNotificationRecord,
            FfUserPushNotificationRecordBuilder> {
  _$FfUserPushNotificationRecord? _$v;

  String? _notificationText;
  String? get notificationText => _$this._notificationText;
  set notificationText(String? notificationText) =>
      _$this._notificationText = notificationText;

  String? _devname;
  String? get devname => _$this._devname;
  set devname(String? devname) => _$this._devname = devname;

  String? _platname;
  String? get platname => _$this._platname;
  set platname(String? platname) => _$this._platname = platname;

  String? _notificationTitle;
  String? get notificationTitle => _$this._notificationTitle;
  set notificationTitle(String? notificationTitle) =>
      _$this._notificationTitle = notificationTitle;

  DocumentReference<Object?>? _sender;
  DocumentReference<Object?>? get sender => _$this._sender;
  set sender(DocumentReference<Object?>? sender) => _$this._sender = sender;

  bool? _marked;
  bool? get marked => _$this._marked;
  set marked(bool? marked) => _$this._marked = marked;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FfUserPushNotificationRecordBuilder() {
    FfUserPushNotificationRecord._initializeBuilder(this);
  }

  FfUserPushNotificationRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _notificationText = $v.notificationText;
      _notificationTitle = $v.notificationTitle;
      _sender = $v.sender;
      _marked = $v.marked;
      _devname = $v.devname;
      _platname = $v.platname;
      _timestamp = $v.timestamp;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FfUserPushNotificationRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FfUserPushNotificationRecord;
  }

  @override
  void update(void Function(FfUserPushNotificationRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FfUserPushNotificationRecord build() => _build();

  _$FfUserPushNotificationRecord _build() {
    final _$result = _$v ??
        new _$FfUserPushNotificationRecord._(
            notificationText: notificationText,
            notificationTitle: notificationTitle,
            devname: devname,
            platname: platname,
            sender: sender,
            timestamp: timestamp,
            marked: marked,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
