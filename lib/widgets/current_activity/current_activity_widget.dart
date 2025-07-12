import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'current_activity_model.dart';
export 'current_activity_model.dart';

class CurrentActivityWidget extends StatefulWidget {
  const CurrentActivityWidget({super.key});

  @override
  State<CurrentActivityWidget> createState() => _CurrentActivityWidgetState();
}

class _CurrentActivityWidgetState extends State<CurrentActivityWidget> {
  late CurrentActivityModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CurrentActivityModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: FlutterFlowTheme.of(context).accent2,
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 48.0,
              height: 48.0,
              decoration: BoxDecoration(
                color: Color(0xFFFFD600),
                shape: BoxShape.circle,
              ),
              child: Stack(
                children: [
                  if (FFAppState().currentActivityName == 'Idle')
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.man_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 32.0,
                      ),
                    ),
                  if (FFAppState().currentActivityName == 'Walking')
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.directions_walk,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 32.0,
                      ),
                    ),
                  if (FFAppState().currentActivityName == 'Running')
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.directions_run_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 32.0,
                      ),
                    ),
                  if (FFAppState().currentActivityName == 'Stairs Up')
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.angleDoubleUp,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 26.0,
                      ),
                    ),
                  if (FFAppState().currentActivityName == 'Stairs Down')
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.angleDoubleDown,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 26.0,
                      ),
                    ),
                  if (FFAppState().currentActivityName == 'Unknown')
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.highlight_off_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 32.0,
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 12.0, 0.0),
              child: Text(
                FFAppState().currentActivityName,
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      font: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                      color: Color(0xFF1A2A3A),
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleMedium.fontStyle,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
