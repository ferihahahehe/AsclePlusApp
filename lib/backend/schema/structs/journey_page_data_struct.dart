// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JourneyPageDataStruct extends BaseStruct {
  JourneyPageDataStruct({
    List<String>? dayLabels,
    List<double>? idleGood,
    List<double>? idleBad,
    List<double>? walkingGood,
    List<double>? walkingBad,
    List<double>? runningGood,
    List<double>? runningBad,
    List<double>? stairsUpGood,
    List<double>? stairsUpBad,
    List<double>? stairsDownGood,
    List<double>? stairsDownBad,
    double? weeklyTotalGood,
    double? weeklyTotalBad,
  })  : _dayLabels = dayLabels,
        _idleGood = idleGood,
        _idleBad = idleBad,
        _walkingGood = walkingGood,
        _walkingBad = walkingBad,
        _runningGood = runningGood,
        _runningBad = runningBad,
        _stairsUpGood = stairsUpGood,
        _stairsUpBad = stairsUpBad,
        _stairsDownGood = stairsDownGood,
        _stairsDownBad = stairsDownBad,
        _weeklyTotalGood = weeklyTotalGood,
        _weeklyTotalBad = weeklyTotalBad;

  // "dayLabels" field.
  List<String>? _dayLabels;
  List<String> get dayLabels => _dayLabels ?? const [];
  set dayLabels(List<String>? val) => _dayLabels = val;

  void updateDayLabels(Function(List<String>) updateFn) {
    updateFn(_dayLabels ??= []);
  }

  bool hasDayLabels() => _dayLabels != null;

  // "idleGood" field.
  List<double>? _idleGood;
  List<double> get idleGood => _idleGood ?? const [];
  set idleGood(List<double>? val) => _idleGood = val;

  void updateIdleGood(Function(List<double>) updateFn) {
    updateFn(_idleGood ??= []);
  }

  bool hasIdleGood() => _idleGood != null;

  // "idleBad" field.
  List<double>? _idleBad;
  List<double> get idleBad => _idleBad ?? const [];
  set idleBad(List<double>? val) => _idleBad = val;

  void updateIdleBad(Function(List<double>) updateFn) {
    updateFn(_idleBad ??= []);
  }

  bool hasIdleBad() => _idleBad != null;

  // "walkingGood" field.
  List<double>? _walkingGood;
  List<double> get walkingGood => _walkingGood ?? const [];
  set walkingGood(List<double>? val) => _walkingGood = val;

  void updateWalkingGood(Function(List<double>) updateFn) {
    updateFn(_walkingGood ??= []);
  }

  bool hasWalkingGood() => _walkingGood != null;

  // "walkingBad" field.
  List<double>? _walkingBad;
  List<double> get walkingBad => _walkingBad ?? const [];
  set walkingBad(List<double>? val) => _walkingBad = val;

  void updateWalkingBad(Function(List<double>) updateFn) {
    updateFn(_walkingBad ??= []);
  }

  bool hasWalkingBad() => _walkingBad != null;

  // "runningGood" field.
  List<double>? _runningGood;
  List<double> get runningGood => _runningGood ?? const [];
  set runningGood(List<double>? val) => _runningGood = val;

  void updateRunningGood(Function(List<double>) updateFn) {
    updateFn(_runningGood ??= []);
  }

  bool hasRunningGood() => _runningGood != null;

  // "runningBad" field.
  List<double>? _runningBad;
  List<double> get runningBad => _runningBad ?? const [];
  set runningBad(List<double>? val) => _runningBad = val;

  void updateRunningBad(Function(List<double>) updateFn) {
    updateFn(_runningBad ??= []);
  }

  bool hasRunningBad() => _runningBad != null;

  // "stairsUpGood" field.
  List<double>? _stairsUpGood;
  List<double> get stairsUpGood => _stairsUpGood ?? const [];
  set stairsUpGood(List<double>? val) => _stairsUpGood = val;

  void updateStairsUpGood(Function(List<double>) updateFn) {
    updateFn(_stairsUpGood ??= []);
  }

  bool hasStairsUpGood() => _stairsUpGood != null;

  // "stairsUpBad" field.
  List<double>? _stairsUpBad;
  List<double> get stairsUpBad => _stairsUpBad ?? const [];
  set stairsUpBad(List<double>? val) => _stairsUpBad = val;

  void updateStairsUpBad(Function(List<double>) updateFn) {
    updateFn(_stairsUpBad ??= []);
  }

  bool hasStairsUpBad() => _stairsUpBad != null;

  // "stairsDownGood" field.
  List<double>? _stairsDownGood;
  List<double> get stairsDownGood => _stairsDownGood ?? const [];
  set stairsDownGood(List<double>? val) => _stairsDownGood = val;

  void updateStairsDownGood(Function(List<double>) updateFn) {
    updateFn(_stairsDownGood ??= []);
  }

  bool hasStairsDownGood() => _stairsDownGood != null;

  // "stairsDownBad" field.
  List<double>? _stairsDownBad;
  List<double> get stairsDownBad => _stairsDownBad ?? const [];
  set stairsDownBad(List<double>? val) => _stairsDownBad = val;

  void updateStairsDownBad(Function(List<double>) updateFn) {
    updateFn(_stairsDownBad ??= []);
  }

  bool hasStairsDownBad() => _stairsDownBad != null;

  // "weeklyTotalGood" field.
  double? _weeklyTotalGood;
  double get weeklyTotalGood => _weeklyTotalGood ?? 0.0;
  set weeklyTotalGood(double? val) => _weeklyTotalGood = val;

  void incrementWeeklyTotalGood(double amount) =>
      weeklyTotalGood = weeklyTotalGood + amount;

  bool hasWeeklyTotalGood() => _weeklyTotalGood != null;

  // "weeklyTotalBad" field.
  double? _weeklyTotalBad;
  double get weeklyTotalBad => _weeklyTotalBad ?? 0.0;
  set weeklyTotalBad(double? val) => _weeklyTotalBad = val;

  void incrementWeeklyTotalBad(double amount) =>
      weeklyTotalBad = weeklyTotalBad + amount;

  bool hasWeeklyTotalBad() => _weeklyTotalBad != null;

  static JourneyPageDataStruct fromMap(Map<String, dynamic> data) =>
      JourneyPageDataStruct(
        dayLabels: getDataList(data['dayLabels']),
        idleGood: getDataList(data['idleGood']),
        idleBad: getDataList(data['idleBad']),
        walkingGood: getDataList(data['walkingGood']),
        walkingBad: getDataList(data['walkingBad']),
        runningGood: getDataList(data['runningGood']),
        runningBad: getDataList(data['runningBad']),
        stairsUpGood: getDataList(data['stairsUpGood']),
        stairsUpBad: getDataList(data['stairsUpBad']),
        stairsDownGood: getDataList(data['stairsDownGood']),
        stairsDownBad: getDataList(data['stairsDownBad']),
        weeklyTotalGood: castToType<double>(data['weeklyTotalGood']),
        weeklyTotalBad: castToType<double>(data['weeklyTotalBad']),
      );

  static JourneyPageDataStruct? maybeFromMap(dynamic data) => data is Map
      ? JourneyPageDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'dayLabels': _dayLabels,
        'idleGood': _idleGood,
        'idleBad': _idleBad,
        'walkingGood': _walkingGood,
        'walkingBad': _walkingBad,
        'runningGood': _runningGood,
        'runningBad': _runningBad,
        'stairsUpGood': _stairsUpGood,
        'stairsUpBad': _stairsUpBad,
        'stairsDownGood': _stairsDownGood,
        'stairsDownBad': _stairsDownBad,
        'weeklyTotalGood': _weeklyTotalGood,
        'weeklyTotalBad': _weeklyTotalBad,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dayLabels': serializeParam(
          _dayLabels,
          ParamType.String,
          isList: true,
        ),
        'idleGood': serializeParam(
          _idleGood,
          ParamType.double,
          isList: true,
        ),
        'idleBad': serializeParam(
          _idleBad,
          ParamType.double,
          isList: true,
        ),
        'walkingGood': serializeParam(
          _walkingGood,
          ParamType.double,
          isList: true,
        ),
        'walkingBad': serializeParam(
          _walkingBad,
          ParamType.double,
          isList: true,
        ),
        'runningGood': serializeParam(
          _runningGood,
          ParamType.double,
          isList: true,
        ),
        'runningBad': serializeParam(
          _runningBad,
          ParamType.double,
          isList: true,
        ),
        'stairsUpGood': serializeParam(
          _stairsUpGood,
          ParamType.double,
          isList: true,
        ),
        'stairsUpBad': serializeParam(
          _stairsUpBad,
          ParamType.double,
          isList: true,
        ),
        'stairsDownGood': serializeParam(
          _stairsDownGood,
          ParamType.double,
          isList: true,
        ),
        'stairsDownBad': serializeParam(
          _stairsDownBad,
          ParamType.double,
          isList: true,
        ),
        'weeklyTotalGood': serializeParam(
          _weeklyTotalGood,
          ParamType.double,
        ),
        'weeklyTotalBad': serializeParam(
          _weeklyTotalBad,
          ParamType.double,
        ),
      }.withoutNulls;

  static JourneyPageDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      JourneyPageDataStruct(
        dayLabels: deserializeParam<String>(
          data['dayLabels'],
          ParamType.String,
          true,
        ),
        idleGood: deserializeParam<double>(
          data['idleGood'],
          ParamType.double,
          true,
        ),
        idleBad: deserializeParam<double>(
          data['idleBad'],
          ParamType.double,
          true,
        ),
        walkingGood: deserializeParam<double>(
          data['walkingGood'],
          ParamType.double,
          true,
        ),
        walkingBad: deserializeParam<double>(
          data['walkingBad'],
          ParamType.double,
          true,
        ),
        runningGood: deserializeParam<double>(
          data['runningGood'],
          ParamType.double,
          true,
        ),
        runningBad: deserializeParam<double>(
          data['runningBad'],
          ParamType.double,
          true,
        ),
        stairsUpGood: deserializeParam<double>(
          data['stairsUpGood'],
          ParamType.double,
          true,
        ),
        stairsUpBad: deserializeParam<double>(
          data['stairsUpBad'],
          ParamType.double,
          true,
        ),
        stairsDownGood: deserializeParam<double>(
          data['stairsDownGood'],
          ParamType.double,
          true,
        ),
        stairsDownBad: deserializeParam<double>(
          data['stairsDownBad'],
          ParamType.double,
          true,
        ),
        weeklyTotalGood: deserializeParam(
          data['weeklyTotalGood'],
          ParamType.double,
          false,
        ),
        weeklyTotalBad: deserializeParam(
          data['weeklyTotalBad'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'JourneyPageDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is JourneyPageDataStruct &&
        listEquality.equals(dayLabels, other.dayLabels) &&
        listEquality.equals(idleGood, other.idleGood) &&
        listEquality.equals(idleBad, other.idleBad) &&
        listEquality.equals(walkingGood, other.walkingGood) &&
        listEquality.equals(walkingBad, other.walkingBad) &&
        listEquality.equals(runningGood, other.runningGood) &&
        listEquality.equals(runningBad, other.runningBad) &&
        listEquality.equals(stairsUpGood, other.stairsUpGood) &&
        listEquality.equals(stairsUpBad, other.stairsUpBad) &&
        listEquality.equals(stairsDownGood, other.stairsDownGood) &&
        listEquality.equals(stairsDownBad, other.stairsDownBad) &&
        weeklyTotalGood == other.weeklyTotalGood &&
        weeklyTotalBad == other.weeklyTotalBad;
  }

  @override
  int get hashCode => const ListEquality().hash([
        dayLabels,
        idleGood,
        idleBad,
        walkingGood,
        walkingBad,
        runningGood,
        runningBad,
        stairsUpGood,
        stairsUpBad,
        stairsDownGood,
        stairsDownBad,
        weeklyTotalGood,
        weeklyTotalBad
      ]);
}

JourneyPageDataStruct createJourneyPageDataStruct({
  double? weeklyTotalGood,
  double? weeklyTotalBad,
}) =>
    JourneyPageDataStruct(
      weeklyTotalGood: weeklyTotalGood,
      weeklyTotalBad: weeklyTotalBad,
    );
