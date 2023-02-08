import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

final random = math.Random();
const Color red = Colors.red;
const Color green = Colors.green;
// const Color greenBack = Color.fromARGB(34, 76, 175, 79);
// const Color redBack = Color.fromARGB(33, 175, 76, 76);
const Color greenBack = Color.fromARGB(16, 76, 175, 79);
const Color redBack = Color.fromARGB(20, 175, 76, 76);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          children: const [
            Text(
              'Graph',
              textAlign: TextAlign.start,
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: const [
                  // SizedBox(
                  //   height: 180,
                  //   width: 280,
                  //   child: LineChart(sampleData(l1, green, greenBack)),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

LineChartData sampleData(l, color, colorb, maxX, maxY) {
  return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      maxX: maxX,
      maxY: maxY,
      minY: 0,
      lineBarsData: linesBarData(l, color, colorb));
}

List<LineChartBarData> linesBarData(l, color, colorb) {
  return [
    LineChartBarData(
        spots: l,
        shadow: const Shadow(
            color: Colors.white, blurRadius: 20, offset: Offset(0, 0)),
        isCurved: true,
        color: color,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: true, color: colorb)),
  ];
}
