// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BTDeviceStruct extends BaseStruct {
  BTDeviceStruct({
    String? name,
    String? id,
    int? rssi,
    bool? hasWriteCharacteristic,
  })  : _name = name,
        _id = id,
        _rssi = rssi,
        _hasWriteCharacteristic = hasWriteCharacteristic;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "rssi" field.
  int? _rssi;
  int get rssi => _rssi ?? 0;
  set rssi(int? val) => _rssi = val;

  void incrementRssi(int amount) => rssi = rssi + amount;

  bool hasRssi() => _rssi != null;

  // "hasWriteCharacteristic" field.
  bool? _hasWriteCharacteristic;
  bool get hasWriteCharacteristic => _hasWriteCharacteristic ?? false;
  set hasWriteCharacteristic(bool? val) => _hasWriteCharacteristic = val;

  bool hasHasWriteCharacteristic() => _hasWriteCharacteristic != null;

  static BTDeviceStruct fromMap(Map<String, dynamic> data) => BTDeviceStruct(
        name: data['name'] as String?,
        id: data['id'] as String?,
        rssi: castToType<int>(data['rssi']),
        hasWriteCharacteristic: data['hasWriteCharacteristic'] as bool?,
      );

  static BTDeviceStruct? maybeFromMap(dynamic data) =>
      data is Map ? BTDeviceStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'id': _id,
        'rssi': _rssi,
        'hasWriteCharacteristic': _hasWriteCharacteristic,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'rssi': serializeParam(
          _rssi,
          ParamType.int,
        ),
        'hasWriteCharacteristic': serializeParam(
          _hasWriteCharacteristic,
          ParamType.bool,
        ),
      }.withoutNulls;

  static BTDeviceStruct fromSerializableMap(Map<String, dynamic> data) =>
      BTDeviceStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        rssi: deserializeParam(
          data['rssi'],
          ParamType.int,
          false,
        ),
        hasWriteCharacteristic: deserializeParam(
          data['hasWriteCharacteristic'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'BTDeviceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BTDeviceStruct &&
        name == other.name &&
        id == other.id &&
        rssi == other.rssi &&
        hasWriteCharacteristic == other.hasWriteCharacteristic;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, id, rssi, hasWriteCharacteristic]);
}

BTDeviceStruct createBTDeviceStruct({
  String? name,
  String? id,
  int? rssi,
  bool? hasWriteCharacteristic,
}) =>
    BTDeviceStruct(
      name: name,
      id: id,
      rssi: rssi,
      hasWriteCharacteristic: hasWriteCharacteristic,
    );
