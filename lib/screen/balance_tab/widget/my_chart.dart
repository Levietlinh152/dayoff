import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/ChartData.dart';

class MyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 70, Color.fromRGBO(100, 100, 200, 1)),
      ChartData('Jack', 40, Colors.white),
    ];
    return Scaffold(
        body: Center(
            child: SfCircularChart(annotations: <CircularChartAnnotation>[
      CircularChartAnnotation(
          widget: PhysicalModel(
              child: Container(),
              shape: BoxShape.circle,
              elevation: 10,
              shadowColor: Colors.black,
              color: Colors.white)),
      CircularChartAnnotation(
          widget: const Text('0/12',
              style:
                  TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 20)))
    ], series: <CircularSeries>[
      DoughnutSeries<ChartData, String>(
        dataSource: chartData,
        xValueMapper: (ChartData data, _) => data.x,
        yValueMapper: (ChartData data, _) => data.y,
        // Radius of doughnut
        radius: 70.toString(),
      )
    ])));
  }
}
