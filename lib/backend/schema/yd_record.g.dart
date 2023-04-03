// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yd_record.dart';

// ************************************************************************
// BuiltValueGenerator
// ************************************************************************

Serializer<YdRecord> _$ydRecordSerializer = new _$YdRecordSerializer();

class _$YdRecordSerializer implements StructuredSerializer<YdRecord> {
  @override
  final Iterable<Type> types = const [YdRecord, _$YdRecord];
  @override
  final String wireName = 'YdRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, YdRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.snDevice;
    if (value != null) {
      result
        ..add('sn_device')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.topic;
    if (value != null) {
      result
        ..add('Topic')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.yfp;
    if (value != null) {
      result
        ..add('YFP')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.idf;
    if (value != null) {
      result
        ..add('IDF')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.powers;
    if (value != null) {
      result
        ..add('POWERS')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Map)])));
    }
    value = object.wifi;
    if (value != null) {
      result
        ..add('Wifi')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Map)])));
    }

    value = object.energy;
    if (value != null) {
      result
        ..add('ENERGY')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Map)])));
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
  YdRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new YdRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'sn_device':
          result.snDevice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Topic':
          result.topic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'YFP':
          result.yfp = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'IDF':
          result.idf = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'POWERS':
          final Map mapStruct = value as Map;
          final BuiltMap<String, String> powersMap = BuiltMap<String, String>(
            mapStruct
                .map((key, value) => MapEntry(key as String, value as String)),
          );
          result.powers = powersMap.toMap();
          break;

        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Wifi':
          final Map mapStruct = value as Map;
          final BuiltMap<String, dynamic> wifiMap = BuiltMap<String, dynamic>(
            mapStruct.map((key, value) {
              if (key is String && (value is String || value is int)) {
                return MapEntry(key, value);
              } else {
                throw ArgumentError('Invalid key or value type in Wifi map');
              }
            }),
          );
          result.wifi = wifiMap.toMap();
          break;
        case 'ENERGY':
          final Map mapStruct = value as Map;
          final BuiltMap<String, dynamic> energyMap = BuiltMap<String, dynamic>(
            mapStruct.map((key, value) {
              if (key is String &&
                  (value is String ||
                      value is int ||
                      value is List ||
                      value is double)) {
                return MapEntry(key, value);
              } else {
                throw ArgumentError('Invalid key or value type in energy map');
              }
            }),
          );
          result.energy = energyMap.toMap();
          break;
      }
    }

    return result.build();
  }
}

class _$YdRecord extends YdRecord {
  @override
  final String? snDevice;
  @override
  final String? topic;
  @override
  final String? yfp;
  @override
  final String? idf;
  @override
  final Map<String, String>? powers;
  @override
  final Map<String, dynamic>? wifi;
  @override
  final Map<String, dynamic>? energy;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$YdRecord([void Function(YdRecordBuilder)? updates]) =>
      (new YdRecordBuilder()..update(updates))._build();

  _$YdRecord._({
    this.snDevice,
    this.topic,
    this.yfp,
    this.idf,
    this.powers,
    this.wifi,
    this.energy,
    this.ffRef,
  }) : super._();

  @override
  YdRecord rebuild(void Function(YdRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  YdRecordBuilder toBuilder() => new YdRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is YdRecord &&
        snDevice == other.snDevice &&
        topic == other.topic &&
        yfp == other.yfp &&
        idf == other.idf &&
        powers == other.powers &&
        wifi == other.wifi &&
        energy == other.energy &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, snDevice.hashCode), topic.hashCode),
                    yfp.hashCode),
                idf.hashCode),
            powers.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'YdRecord')
          ..add('sn_device', snDevice)
          ..add('topic', topic)
          ..add('yfp', yfp)
          ..add('idf', idf)
          ..add('powers', powers)
          ..add('wifi', wifi)
          ..add('energy', energy)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class YdRecordBuilder implements Builder<YdRecord, YdRecordBuilder> {
  _$YdRecord? _$v;

  String? _snDevice;
  String? get snDevice => _$this._snDevice;
  set snDevice(String? snDevice) => _$this._snDevice = snDevice;

  String? _topic;
  String? get topic => _$this._topic;
  set topic(String? topic) => _$this._topic = topic;

  String? _yfp;
  String? get yfp => _$this._yfp;
  set yfp(String? yfp) => _$this._yfp = yfp;

  String? _idf;
  String? get idf => _$this._idf;
  set idf(String? idf) => _$this._idf = idf;

  Map<String, String>? _powers;
  Map<String, String>? get powers =>
      _$this._powers ??= new Map<String, String>();
  set powers(Map<String, String>? powers) => _$this._powers = powers;

  Map<String, dynamic>? _wifi;
  Map<String, dynamic>? get wifi => _$this._wifi ??= new Map<String, dynamic>();
  set wifi(Map<String, dynamic>? wifi) => _$this._wifi = wifi;

  Map<String, dynamic>? _energy;
  Map<String, dynamic>? get energy =>
      _$this._energy ??= new Map<String, dynamic>();
  set energy(Map<String, dynamic>? energy) => _$this._energy = energy;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  YdRecordBuilder() {
    YdRecord._initializeBuilder(this);
  }

  YdRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _snDevice = $v.snDevice;
      _topic = $v.topic;
      _yfp = $v.yfp;
      _idf = $v.idf;
      _powers = $v.powers;
      _wifi = $v.wifi;
      _energy = $v.energy;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(YdRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$YdRecord;
  }

  @override
  void update(void Function(YdRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  YdRecord build() => _build();

  _$YdRecord _build() {
    _$YdRecord _$result;
    try {
      _$result = _$v ??
          new _$YdRecord._(
              snDevice: snDevice,
              topic: topic,
              yfp: yfp,
              idf: idf,
              powers: _powers,
              wifi: _wifi,
              energy: _energy,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'powers';
        _powers;
        _$failedField = 'wifi';
        _wifi;
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'YdRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas