import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/widgets/strength_indicator/strength_indicator_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'device_page_widget.dart' show DevicePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DevicePageModel extends FlutterFlowModel<DevicePageWidget> {
  ///  Local state fields for this page.

  int? currentRssi = -100;

  String? receivedValue;

  ///  State fields for stateful widgets in this page.

  InstantTimer? rssiUpdateTimer;
  // Stores action output result for [Custom Action - getRssi] action in DevicePage widget.
  int? updatedRssi;
  // Model for StrengthIndicator component.
  late StrengthIndicatorModel strengthIndicatorModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    strengthIndicatorModel =
        createModel(context, () => StrengthIndicatorModel());
  }

  @override
  void dispose() {
    rssiUpdateTimer?.cancel();
    strengthIndicatorModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
