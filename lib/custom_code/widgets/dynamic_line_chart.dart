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

class DynamicLineChart extends StatefulWidget {
  const DynamicLineChart({
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
  _DynamicLineChartState createState() => _DynamicLineChartState();
}

class _DynamicLineChartState extends State<DynamicLineChart> {
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

    // Konversi data untuk Line Chart (tidak berubah)
    List<FlSpot> goodSpots = [];
    for (int i = 0; i < widget.goodData.length; i++) {
      goodSpots.add(FlSpot(i.toDouble(), widget.goodData[i]));
    }

    List<FlSpot> badSpots = [];
    for (int i = 0; i < widget.badData.length; i++) {
      badSpots.add(FlSpot(i.toDouble(), widget.badData[i]));
    }

    return Container(
      width: widget.width,
      height: widget.height,
      child: LineChart(
        LineChartData(
          maxY: finalMaxY,
          minY: 0,
          minX: -0.5,
          maxX: widget.xLabels.isNotEmpty
              ? (widget.xLabels.length - 1).toDouble() + 0.5
              : 0.5,
          clipData: FlClipData.all(),
          lineTouchData: LineTouchData(
            handleBuiltInTouches: true,
            getTouchedSpotIndicator:
                (LineChartBarData barData, List<int> spotIndexes) {
              return spotIndexes.map((spotIndex) {
                return TouchedSpotIndicatorData(
                  FlLine(
                    color: FlutterFlowTheme.of(context).alternate,
                    strokeWidth: 1,
                    dashArray: [4, 4],
                  ),
                  FlDotData(
                    getDotPainter: (spot, percent, barData, index) {
                      // --- [AWAL] PERBAIKAN ERROR NULL SAFETY ---
                      final dotColor =
                          barData.color ?? FlutterFlowTheme.of(context).primary;
                      return FlDotCirclePainter(
                        radius: 8.0,
                        color: dotColor.withOpacity(0.8),
                        strokeWidth: 2,
                        strokeColor: Colors.white,
                      );
                      // --- [AKHIR] PERBAIKAN ERROR NULL SAFETY ---
                    },
                  ),
                );
              }).toList();
            },
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (touchedSpot) => Colors.transparent,
              getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                return touchedBarSpots.map((barSpot) {
                  return LineTooltipItem(
                    barSpot.y.toStringAsFixed(2),
                    TextStyle(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }).toList();
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
                // --- [AWAL] PERUBAHAN PADDING KANAN ---
                reservedSize: 15, // Setengah dari 30
                getTitlesWidget: (value, meta) => Container(),
                // --- [AKHIR] PERUBAHAN PADDING KANAN ---
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                // --- [AWAL] PERUBAHAN PADDING ATAS ---
                reservedSize: 18, // Setengah dari 36
                getTitlesWidget: (value, meta) => Container(),
                // --- [AKHIR] PERUBAHAN PADDING ATAS ---
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  if (value.floor() != value) {
                    return Container();
                  }
                  final index = value.toInt();
                  if (index >= 0 && index < widget.xLabels.length) {
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      space: 8.0,
                      child: Text(
                        widget.xLabels[index],
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
                reservedSize: 30,
                getTitlesWidget: (double value, TitleMeta meta) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 2.0,
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
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: goodSpots,
              isCurved: false,
              color: widget.goodColor ?? FlutterFlowTheme.of(context).success,
              barWidth: 4,
              isStrokeCapRound: true,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(show: false),
            ),
            LineChartBarData(
              spots: badSpots,
              isCurved: false,
              color: widget.badColor ?? FlutterFlowTheme.of(context).error,
              barWidth: 4,
              isStrokeCapRound: true,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
