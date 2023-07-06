import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_data.dart';

class ChartSemuaData extends StatelessWidget {
  const ChartSemuaData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Yaomink',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: Colors.green),
                    ),
                    Text(
                      'Admin',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey[400]!,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.search),
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: null,
                          decoration: const InputDecoration.collapsed(
                            filled: true,
                            fillColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            hintText: "Search",
                          ),
                          onFieldSubmitted: (value) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 60.0,
          ),
          Text(
            'Semua Data',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: SfCartesianChart(
              onMarkerRender: (MarkerRenderArgs args) {
                if (!(args.pointIndex == 7)) {
                  args.markerHeight = 0;
                  args.borderWidth = 0;
                }
              },
              onDataLabelRender: (DataLabelRenderArgs args) {
                int index = args.pointIndex!;
                List<CartesianChartPoint<dynamic>> dataPoint = args.dataPoints;
                if (dataPoint[index].y == 1200) {
                  args.text = 'Total Users';
                  args.textStyle =
                      const TextStyle(fontSize: 10.0, color: Colors.black);
                  args.offset = const Offset(0, 20);
                }
                if (dataPoint[index].y != 1200) {
                  args.text = '';
                  args.offset = const Offset(0, 20);
                }
              },
              primaryXAxis: CategoryAxis(
                labelPosition: ChartDataLabelPosition.outside,
                labelAlignment: LabelAlignment.center,
                labelPlacement: LabelPlacement.onTicks,
                axisLine: const AxisLine(width: 0),
                majorGridLines: const MajorGridLines(width: 0),
                majorTickLines: const MajorTickLines(width: 0),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                plotOffset: 5,
                labelsExtent: 30,
                interval: 3,
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
              ),
              primaryYAxis: NumericAxis(
                  axisLine: const AxisLine(width: 0),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  minimum: 0,
                  maximum: 1500,
                  interval: 500),
              series: <ChartSeries>[
                SplineAreaSeries<ChartData, String>(
                  dataSource: allDataChart,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  gradient: LinearGradient(
                    colors: [Colors.greenAccent, Colors.black.withAlpha(150)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                SplineSeries<ChartData, String>(
                  width: 2,
                  markerSettings: const MarkerSettings(
                      isVisible: true,
                      color: Colors.black,
                      borderColor: Colors.white),
                  dataSource: allDataChart,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      labelAlignment: ChartDataLabelAlignment.top),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final List<ChartData> allDataChart = [
  ChartData(x: 'Jan', y: 100),
  ChartData(x: 'Feb', y: 400),
  ChartData(x: 'Mar', y: 800),
  ChartData(x: 'April', y: 200),
  ChartData(x: 'Mei', y: 500),
  ChartData(x: 'Jun', y: 700),
  ChartData(x: 'Jul', y: 1200),
  ChartData(x: 'Agus', y: 800),
  ChartData(x: 'Sep', y: 300),
  ChartData(x: 'Okt', y: 1000),
  ChartData(x: 'Nov', y: 450),
  ChartData(x: 'Des', y: 900),
];
