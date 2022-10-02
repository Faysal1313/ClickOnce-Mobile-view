import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
//import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Chart extends StatefulWidget {
  Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  late List<GDPData> _charData;
  late TooltipBehavior _tooltipBehaviro;

  void initState() {
    _charData = getchartData();
    _tooltipBehaviro = TooltipBehavior(enable: true);
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SfCircularChart(
        title: ChartTitle(text: 'Continent with GDP-2021 '),
        legend:
            Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
        tooltipBehavior: _tooltipBehaviro,
        series: <CircularSeries>[
          PieSeries<GDPData, String>(
              dataSource: _charData,
              xValueMapper: (GDPData data, _) => data.continent,
              yValueMapper: (GDPData data, _) => data.gdp,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true),
        ],
      ),
    ));
  }

  List<GDPData> getchartData() {
    final List<GDPData> chartData = [
      GDPData('Oceania', 1600),
      GDPData('Africa', 2490),
      GDPData('S America', 2900),
      GDPData('Europ', 21000),
      GDPData('S America', 24880),
      GDPData('Asia', 34390),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
