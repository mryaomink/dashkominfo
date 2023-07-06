import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_data.dart';

class ChartAp extends StatelessWidget {
  const ChartAp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Data',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                'Satu Data',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.grey, fontSize: 14.0),
              ),
              const Icon(
                Icons.expand_more_outlined,
                color: Colors.black,
              )
            ],
          ),
          Row(
            children: [
              Text(
                '1200 Data',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.green, fontSize: 16.0),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            onPressed: () {},
            child: const Text(
              "More Info",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'List Apps',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        'Badapat',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Colors.grey, fontSize: 14.0),
                      ),
                      const Icon(
                        Icons.expand_more_outlined,
                        color: Colors.black,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Banjarbaru Dalam Peta',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: Colors.green, fontSize: 16.0),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 16.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: SfCircularChart(
                            series: <CircularSeries>[
                              DoughnutSeries<ChartData, String>(
                                innerRadius: "80%",
                                startAngle: 270,
                                endAngle: 270,
                                dataSource: chartData,
                                pointColorMapper: (ChartData data, _) =>
                                    data.color,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                              ),
                            ],
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_drop_up_outlined,
                            ),
                            Text(
                              'Visitor: 90% up',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final List<ChartData> chartData = [
  ChartData(
    x: "Wisata",
    y: 70.0,
    color: Colors.red,
  ),
  ChartData(
    x: "Kuliner",
    y: 80.0,
    color: Colors.orange,
  ),
  ChartData(
    x: "Hotel",
    y: 90.0,
    color: Colors.purple,
  ),
];
