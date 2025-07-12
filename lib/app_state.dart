import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isBleConnected = prefs.getBool('ff_isBleConnected') ?? _isBleConnected;
    });
    _safeInit(() {
      _isBluetoothEnabled =
          prefs.getBool('ff_isBluetoothEnabled') ?? _isBluetoothEnabled;
    });
    _safeInit(() {
      _ConnectedDevices = prefs
              .getStringList('ff_ConnectedDevices')
              ?.map((x) {
                try {
                  return BTDeviceStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _ConnectedDevices;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_currentDevice')) {
        try {
          final serializedData = prefs.getString('ff_currentDevice') ?? '{}';
          _currentDevice =
              BTDeviceStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _receivedData = prefs.getString('ff_receivedData') ?? _receivedData;
    });
    _safeInit(() {
      _postureLogs = prefs
              .getStringList('ff_postureLogs')
              ?.map((x) {
                try {
                  return PostureLogStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _postureLogs;
    });
    _safeInit(() {
      _globalActivityDurations = prefs
              .getStringList('ff_globalActivityDurations')
              ?.map((x) {
                try {
                  return ActivityDurationStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _globalActivityDurations;
    });
    _safeInit(() {
      _currentFlexAngle =
          prefs.getInt('ff_currentFlexAngle') ?? _currentFlexAngle;
    });
    _safeInit(() {
      _currentCondition =
          prefs.getBool('ff_currentCondition') ?? _currentCondition;
    });
    _safeInit(() {
      _historicalSummaries = prefs
              .getStringList('ff_historicalSummaries')
              ?.map((x) {
                try {
                  return DailyActivitySummaryStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _historicalSummaries;
    });
    _safeInit(() {
      _lastProcessingDate =
          prefs.getString('ff_lastProcessingDate') ?? _lastProcessingDate;
    });
    _safeInit(() {
      _currentActivityName =
          prefs.getString('ff_currentActivityName') ?? _currentActivityName;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isBleConnected = false;
  bool get isBleConnected => _isBleConnected;
  set isBleConnected(bool value) {
    _isBleConnected = value;
    prefs.setBool('ff_isBleConnected', value);
  }

  bool _isBluetoothEnabled = false;
  bool get isBluetoothEnabled => _isBluetoothEnabled;
  set isBluetoothEnabled(bool value) {
    _isBluetoothEnabled = value;
    prefs.setBool('ff_isBluetoothEnabled', value);
  }

  List<BTDeviceStruct> _ConnectedDevices = [];
  List<BTDeviceStruct> get ConnectedDevices => _ConnectedDevices;
  set ConnectedDevices(List<BTDeviceStruct> value) {
    _ConnectedDevices = value;
    prefs.setStringList(
        'ff_ConnectedDevices', value.map((x) => x.serialize()).toList());
  }

  void addToConnectedDevices(BTDeviceStruct value) {
    ConnectedDevices.add(value);
    prefs.setStringList('ff_ConnectedDevices',
        _ConnectedDevices.map((x) => x.serialize()).toList());
  }

  void removeFromConnectedDevices(BTDeviceStruct value) {
    ConnectedDevices.remove(value);
    prefs.setStringList('ff_ConnectedDevices',
        _ConnectedDevices.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromConnectedDevices(int index) {
    ConnectedDevices.removeAt(index);
    prefs.setStringList('ff_ConnectedDevices',
        _ConnectedDevices.map((x) => x.serialize()).toList());
  }

  void updateConnectedDevicesAtIndex(
    int index,
    BTDeviceStruct Function(BTDeviceStruct) updateFn,
  ) {
    ConnectedDevices[index] = updateFn(_ConnectedDevices[index]);
    prefs.setStringList('ff_ConnectedDevices',
        _ConnectedDevices.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInConnectedDevices(int index, BTDeviceStruct value) {
    ConnectedDevices.insert(index, value);
    prefs.setStringList('ff_ConnectedDevices',
        _ConnectedDevices.map((x) => x.serialize()).toList());
  }

  bool _isFetchingConnectedDevices = false;
  bool get isFetchingConnectedDevices => _isFetchingConnectedDevices;
  set isFetchingConnectedDevices(bool value) {
    _isFetchingConnectedDevices = value;
  }

  bool _isFetchingDevices = false;
  bool get isFetchingDevices => _isFetchingDevices;
  set isFetchingDevices(bool value) {
    _isFetchingDevices = value;
  }

  List<BTDeviceStruct> _foundDevices = [];
  List<BTDeviceStruct> get foundDevices => _foundDevices;
  set foundDevices(List<BTDeviceStruct> value) {
    _foundDevices = value;
  }

  void addToFoundDevices(BTDeviceStruct value) {
    foundDevices.add(value);
  }

  void removeFromFoundDevices(BTDeviceStruct value) {
    foundDevices.remove(value);
  }

  void removeAtIndexFromFoundDevices(int index) {
    foundDevices.removeAt(index);
  }

  void updateFoundDevicesAtIndex(
    int index,
    BTDeviceStruct Function(BTDeviceStruct) updateFn,
  ) {
    foundDevices[index] = updateFn(_foundDevices[index]);
  }

  void insertAtIndexInFoundDevices(int index, BTDeviceStruct value) {
    foundDevices.insert(index, value);
  }

  List<BTDeviceStruct> _currentDevices = [];
  List<BTDeviceStruct> get currentDevices => _currentDevices;
  set currentDevices(List<BTDeviceStruct> value) {
    _currentDevices = value;
  }

  void addToCurrentDevices(BTDeviceStruct value) {
    currentDevices.add(value);
  }

  void removeFromCurrentDevices(BTDeviceStruct value) {
    currentDevices.remove(value);
  }

  void removeAtIndexFromCurrentDevices(int index) {
    currentDevices.removeAt(index);
  }

  void updateCurrentDevicesAtIndex(
    int index,
    BTDeviceStruct Function(BTDeviceStruct) updateFn,
  ) {
    currentDevices[index] = updateFn(_currentDevices[index]);
  }

  void insertAtIndexInCurrentDevices(int index, BTDeviceStruct value) {
    currentDevices.insert(index, value);
  }

  BTDeviceStruct _currentDevice = BTDeviceStruct.fromSerializableMap(
      jsonDecode('{\"name\":\"No Device Connected\",\"id\":\"\"}'));
  BTDeviceStruct get currentDevice => _currentDevice;
  set currentDevice(BTDeviceStruct value) {
    _currentDevice = value;
    prefs.setString('ff_currentDevice', value.serialize());
  }

  void updateCurrentDeviceStruct(Function(BTDeviceStruct) updateFn) {
    updateFn(_currentDevice);
    prefs.setString('ff_currentDevice', _currentDevice.serialize());
  }

  String _receivedData = 'Waiting...';
  String get receivedData => _receivedData;
  set receivedData(String value) {
    _receivedData = value;
    prefs.setString('ff_receivedData', value);
  }

  bool _isDeviceConnected = false;
  bool get isDeviceConnected => _isDeviceConnected;
  set isDeviceConnected(bool value) {
    _isDeviceConnected = value;
  }

  List<PostureLogStruct> _postureLogs = [];
  List<PostureLogStruct> get postureLogs => _postureLogs;
  set postureLogs(List<PostureLogStruct> value) {
    _postureLogs = value;
    prefs.setStringList(
        'ff_postureLogs', value.map((x) => x.serialize()).toList());
  }

  void addToPostureLogs(PostureLogStruct value) {
    postureLogs.add(value);
    prefs.setStringList(
        'ff_postureLogs', _postureLogs.map((x) => x.serialize()).toList());
  }

  void removeFromPostureLogs(PostureLogStruct value) {
    postureLogs.remove(value);
    prefs.setStringList(
        'ff_postureLogs', _postureLogs.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPostureLogs(int index) {
    postureLogs.removeAt(index);
    prefs.setStringList(
        'ff_postureLogs', _postureLogs.map((x) => x.serialize()).toList());
  }

  void updatePostureLogsAtIndex(
    int index,
    PostureLogStruct Function(PostureLogStruct) updateFn,
  ) {
    postureLogs[index] = updateFn(_postureLogs[index]);
    prefs.setStringList(
        'ff_postureLogs', _postureLogs.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPostureLogs(int index, PostureLogStruct value) {
    postureLogs.insert(index, value);
    prefs.setStringList(
        'ff_postureLogs', _postureLogs.map((x) => x.serialize()).toList());
  }

  List<ActivityDurationStruct> _globalActivityDurations = [];
  List<ActivityDurationStruct> get globalActivityDurations =>
      _globalActivityDurations;
  set globalActivityDurations(List<ActivityDurationStruct> value) {
    _globalActivityDurations = value;
    prefs.setStringList(
        'ff_globalActivityDurations', value.map((x) => x.serialize()).toList());
  }

  void addToGlobalActivityDurations(ActivityDurationStruct value) {
    globalActivityDurations.add(value);
    prefs.setStringList('ff_globalActivityDurations',
        _globalActivityDurations.map((x) => x.serialize()).toList());
  }

  void removeFromGlobalActivityDurations(ActivityDurationStruct value) {
    globalActivityDurations.remove(value);
    prefs.setStringList('ff_globalActivityDurations',
        _globalActivityDurations.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromGlobalActivityDurations(int index) {
    globalActivityDurations.removeAt(index);
    prefs.setStringList('ff_globalActivityDurations',
        _globalActivityDurations.map((x) => x.serialize()).toList());
  }

  void updateGlobalActivityDurationsAtIndex(
    int index,
    ActivityDurationStruct Function(ActivityDurationStruct) updateFn,
  ) {
    globalActivityDurations[index] = updateFn(_globalActivityDurations[index]);
    prefs.setStringList('ff_globalActivityDurations',
        _globalActivityDurations.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInGlobalActivityDurations(
      int index, ActivityDurationStruct value) {
    globalActivityDurations.insert(index, value);
    prefs.setStringList('ff_globalActivityDurations',
        _globalActivityDurations.map((x) => x.serialize()).toList());
  }

  int _currentFlexAngle = 0;
  int get currentFlexAngle => _currentFlexAngle;
  set currentFlexAngle(int value) {
    _currentFlexAngle = value;
    prefs.setInt('ff_currentFlexAngle', value);
  }

  bool _currentCondition = false;
  bool get currentCondition => _currentCondition;
  set currentCondition(bool value) {
    _currentCondition = value;
    prefs.setBool('ff_currentCondition', value);
  }

  List<DailyActivitySummaryStruct> _historicalSummaries = [];
  List<DailyActivitySummaryStruct> get historicalSummaries =>
      _historicalSummaries;
  set historicalSummaries(List<DailyActivitySummaryStruct> value) {
    _historicalSummaries = value;
    prefs.setStringList(
        'ff_historicalSummaries', value.map((x) => x.serialize()).toList());
  }

  void addToHistoricalSummaries(DailyActivitySummaryStruct value) {
    historicalSummaries.add(value);
    prefs.setStringList('ff_historicalSummaries',
        _historicalSummaries.map((x) => x.serialize()).toList());
  }

  void removeFromHistoricalSummaries(DailyActivitySummaryStruct value) {
    historicalSummaries.remove(value);
    prefs.setStringList('ff_historicalSummaries',
        _historicalSummaries.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromHistoricalSummaries(int index) {
    historicalSummaries.removeAt(index);
    prefs.setStringList('ff_historicalSummaries',
        _historicalSummaries.map((x) => x.serialize()).toList());
  }

  void updateHistoricalSummariesAtIndex(
    int index,
    DailyActivitySummaryStruct Function(DailyActivitySummaryStruct) updateFn,
  ) {
    historicalSummaries[index] = updateFn(_historicalSummaries[index]);
    prefs.setStringList('ff_historicalSummaries',
        _historicalSummaries.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInHistoricalSummaries(
      int index, DailyActivitySummaryStruct value) {
    historicalSummaries.insert(index, value);
    prefs.setStringList('ff_historicalSummaries',
        _historicalSummaries.map((x) => x.serialize()).toList());
  }

  String _lastProcessingDate = '';
  String get lastProcessingDate => _lastProcessingDate;
  set lastProcessingDate(String value) {
    _lastProcessingDate = value;
    prefs.setString('ff_lastProcessingDate', value);
  }

  String _currentActivityName = 'Unknown';
  String get currentActivityName => _currentActivityName;
  set currentActivityName(String value) {
    _currentActivityName = value;
    prefs.setString('ff_currentActivityName', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
