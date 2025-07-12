// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class DynamicBarChart extends StatefulWidget {
  const DynamicBarChart({
    Key? key,
    this.width,
    this.height,
    required this.goodData,
    required this.badData,
    required this.xLabels,
    this.goodColor,
    this.badColor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<double> goodData;
  final List<double> badData;
  final List<String> xLabels;
  final Color? goodColor;
  final Color? badColor;

  @override
  _DynamicBarChartState createState() => _DynamicBarChartState();
}

class _DynamicBarChartState extends State<DynamicBarChart> {
  @override
  Widget build(BuildContext context) {
    // Logika kalkulasi Max Y Dinamis (tidak berubah)
    final allYData = [...widget.goodData, ...widget.badData];
    double finalMaxY = 120.0;
    if (allYData.isNotEmpty) {
      final maxValue = allYData.reduce(max);
      if (maxValue > 0) {
        finalMaxY = (maxValue / 10).ceil() * 10.0;
      } else {
        finalMaxY = 20.0;
      }
    }

    // Data group (tidak berubah)
    List<BarChartGroupData> groups = [];
    for (int i = 0; i < widget.xLabels.length; i++) {
      groups.add(
        BarChartGroupData(
          x: i,
          barsSpace: 5,
          barRods: [
            if (i < widget.goodData.length)
              BarChartRodData(
                toY: widget.goodData[i],
                color: widget.goodColor ?? FlutterFlowTheme.of(context).success,
                width: 16,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
            if (i < widget.badData.length)
              BarChartRodData(
                toY: widget.badData[i],
                color: widget.badColor ?? FlutterFlowTheme.of(context).error,
                width: 16,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
          ],
        ),
      );
    }

    return Container(
      width: widget.width,
      height: widget.height,
      child: BarChart(
        BarChartData(
          maxY: finalMaxY,
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (group) => Colors.transparent,
              tooltipMargin: 8,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  rod.toY.toStringAsFixed(2),
                  TextStyle(
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            drawHorizontalLine: true,
            horizontalInterval: 10,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: FlutterFlowTheme.of(context).alternate,
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 36,
                getTitlesWidget: (value, meta) => Container(),
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                getTitlesWidget: (value, meta) => Container(),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  final index = value.toInt();
                  if (index >= 0 && index < widget.xLabels.length) {
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      space: 8.0,
                      child: Text(
                        widget.xLabels[index].replaceAll(' ', '\n'),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    );
                  }
                  return Text('');
                },
                reservedSize: 36,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 36,
                getTitlesWidget: (double value, TitleMeta meta) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 4.0,
                    child: Text(
                      value.toInt().toString(),
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border(
              bottom: BorderSide(
                color: FlutterFlowTheme.of(context).alternate,
                width: 1,
              ),
              left: BorderSide(color: Colors.transparent),
              top: BorderSide(color: Colors.transparent),
              right: BorderSide(color: Colors.transparent),
            ),
          ),
          barGroups: groups,
          alignment: BarChartAlignment.spaceAround,
          groupsSpace: 8,
        ),
      ),
    );
  }
}
