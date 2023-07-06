import 'package:flutter/material.dart';

import '../widget/chart_ap.dart';
import '../widget/chart_semua_data.dart';
import '../widget/side_menu_yao.dart';

class YaoMain extends StatelessWidget {
  const YaoMain({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: SideMenuYao(height: height),
            ),
            const Expanded(
              flex: 6,
              child: ChartSemuaData(),
            ),
            const Expanded(
              flex: 3,
              child: ChartAp(),
            ),
          ],
        ),
      ),
    );
  }
}
