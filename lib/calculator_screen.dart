import 'package:carbon_emissions/theme/colors.dart';
import 'package:carbon_emissions/utils/route_animation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  List<ChartData> chartData = List.generate(
    27,
    (i) => ChartData((24 + i).toString(), [
      Data('ICE', (1000 * i).toDouble(), AppColors.iceColor),
      Data('HEV', (2000 * i).toDouble(), AppColors.hevColor),
      Data('PHEV', (3000 * i).toDouble(), AppColors.phevColor),
      Data('BEV', (4000 * i).toDouble(), AppColors.bevColor),
      Data('FCEV', (3000 * i).toDouble(), AppColors.fcevColor),
      Data(
          'MITIGATION', (1000 * (i * 3)).toDouble(), AppColors.mitigationColor),
    ]),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(62),
        child: AppBar(
          centerTitle: true,
          forceMaterialTransparency: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 24),
            child:
                Image.asset('assets/images/logo.png', width: 161, height: 45),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg_white.png'),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: SfCartesianChart(
                          title: const ChartTitle(
                            text: 'GOVERMENT REGULATION',
                            textStyle: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          primaryXAxis: const CategoryAxis(
                            interval: 1,
                            autoScrollingMode: AutoScrollingMode.end,
                          ),
                          legend: const Legend(
                            isVisible: true,
                            position: LegendPosition.bottom,
                            isResponsive: true,
                            textStyle: TextStyle(
                              fontSize: 14,
                            ),
                            toggleSeriesVisibility: true,
                          ),
                          series: <CartesianSeries>[
                            StackedColumnSeries<ChartData, String>(
                              dataSource: chartData,
                              color: AppColors.iceColor,
                              legendItemText: 'ICE',
                              legendIconType: LegendIconType.rectangle,
                              xValueMapper: (ChartData data, _) => data.name,
                              yValueMapper: (ChartData data, _) =>
                                  data.dataset[0].value,
                            ),
                            StackedColumnSeries<ChartData, String>(
                              dataSource: chartData,
                              color: AppColors.hevColor,
                              legendItemText: 'HEV',
                              legendIconType: LegendIconType.rectangle,
                              xValueMapper: (ChartData data, _) => data.name,
                              yValueMapper: (ChartData data, _) =>
                                  data.dataset[1].value,
                            ),
                            StackedColumnSeries<ChartData, String>(
                              dataSource: chartData,
                              color: AppColors.phevColor,
                              legendItemText: 'PHEV',
                              legendIconType: LegendIconType.rectangle,
                              xValueMapper: (ChartData data, _) => data.name,
                              yValueMapper: (ChartData data, _) =>
                                  data.dataset[2].value,
                            ),
                            StackedColumnSeries<ChartData, String>(
                              dataSource: chartData,
                              color: AppColors.bevColor,
                              legendItemText: 'BEV',
                              legendIconType: LegendIconType.rectangle,
                              xValueMapper: (ChartData data, _) => data.name,
                              yValueMapper: (ChartData data, _) =>
                                  data.dataset[3].value,
                            ),
                            StackedColumnSeries<ChartData, String>(
                              dataSource: chartData,
                              color: AppColors.fcevColor,
                              legendItemText: 'FCEV',
                              legendIconType: LegendIconType.rectangle,
                              xValueMapper: (ChartData data, _) => data.name,
                              yValueMapper: (ChartData data, _) =>
                                  data.dataset[4].value,
                            ),
                            LineSeries<ChartData, String>(
                              dataSource: chartData,
                              color: AppColors.mitigationColor,
                              legendItemText: 'MITIGATION',
                              xValueMapper: (ChartData data, _) => data.name,
                              yValueMapper: (ChartData data, _) =>
                                  data.dataset[4].value,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: SfCartesianChart(
                          title: const ChartTitle(
                            text: 'ZERO EMISSIONS',
                            textStyle: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          primaryXAxis: const CategoryAxis(
                            interval: 1,
                            autoScrollingMode: AutoScrollingMode.end,
                          ),
                          legend: const Legend(
                            isVisible: true,
                            position: LegendPosition.bottom,
                            isResponsive: true,
                            textStyle: TextStyle(
                              fontSize: 14,
                            ),
                            toggleSeriesVisibility: true,
                          ),
                          series: <CartesianSeries>[
                            StackedColumnSeries<ChartData, String>(
                              dataSource: chartData,
                              color: AppColors.iceColor,
                              legendItemText: 'ICE',
                              legendIconType: LegendIconType.rectangle,
                              xValueMapper: (ChartData data, _) => data.name,
                              yValueMapper: (ChartData data, _) =>
                                  data.dataset[0].value,
                            ),
                            StackedColumnSeries<ChartData, String>(
                              dataSource: chartData,
                              color: AppColors.hevColor,
                              legendItemText: 'HEV',
                              legendIconType: LegendIconType.rectangle,
                              xValueMapper: (ChartData data, _) => data.name,
                              yValueMapper: (ChartData data, _) =>
                                  data.dataset[1].value,
                            ),
                            StackedColumnSeries<ChartData, String>(
                              dataSource: chartData,
                              color: AppColors.phevColor,
                              legendItemText: 'PHEV',
                              legendIconType: LegendIconType.rectangle,
                              xValueMapper: (ChartData data, _) => data.name,
                              yValueMapper: (ChartData data, _) =>
                                  data.dataset[2].value,
                            ),
                            StackedColumnSeries<ChartData, String>(
                              dataSource: chartData,
                              color: AppColors.bevColor,
                              legendItemText: 'BEV',
                              legendIconType: LegendIconType.rectangle,
                              xValueMapper: (ChartData data, _) => data.name,
                              yValueMapper: (ChartData data, _) =>
                                  data.dataset[3].value,
                            ),
                            StackedColumnSeries<ChartData, String>(
                              dataSource: chartData,
                              color: AppColors.fcevColor,
                              legendItemText: 'FCEV',
                              legendIconType: LegendIconType.rectangle,
                              xValueMapper: (ChartData data, _) => data.name,
                              yValueMapper: (ChartData data, _) =>
                                  data.dataset[4].value,
                            ),
                            LineSeries<ChartData, String>(
                              dataSource: chartData,
                              color: Colors.green,
                              legendItemText: 'Ave TtW',
                              xValueMapper: (ChartData data, _) => data.name,
                              yValueMapper: (ChartData data, _) =>
                                  data.dataset[4].value,
                            ),
                            LineSeries<ChartData, String>(
                              dataSource: chartData,
                              color: AppColors.wtwColor,
                              legendItemText: 'Ave WtW',
                              xValueMapper: (ChartData data, _) => data.name,
                              yValueMapper: (ChartData data, _) =>
                                  data.dataset[5].value,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'PARAMETER SETUP',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 145),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'NRE Ratio Increasing\n(max 2.9%)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: 68,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  suffixText: '%'),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Ethanol hancement per\nyear max (max 3.6%)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: 68,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  suffixText: '%'),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Downtrend from 2025\n(max 3%)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: 68,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  suffixText: '%'),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            'ICE',
                            style: TextStyle(
                              color: AppColors.yellowColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Uptrend toward 2035\n',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: 68,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  suffixText: '%'),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const Text(
                            'HEV',
                            style: TextStyle(
                              color: AppColors.yellowColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Uptrend Untill 2050\n',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: 68,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  suffixText: '%'),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const Text(
                            'PHEV',
                            style: TextStyle(
                              color: AppColors.yellowColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Uptrend until 2050\n',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: 68,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  suffixText: '%'),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const Text(
                            'BEV',
                            style: TextStyle(
                              color: AppColors.yellowColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Market growth from\n2040',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: 68,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  suffixText: '%'),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const Text(
                            'FCEV',
                            style: TextStyle(
                              color: AppColors.yellowColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(296, 85),
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          RouteUtils().createRoute(const CalculatorScreen()));
                    },
                    child: const Text(
                      'CALCULATE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.name, this.dataset);
  final String name;
  final List<Data> dataset;
}

class Data {
  Data(
    this.name,
    this.value,
    this.color,
  );

  final String name;
  final Color color;
  final double value;
}
