import 'package:carbon_emissions/theme/colors.dart';
import 'package:carbon_emissions/utils/route_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  List<Map<String, dynamic>> chartData = List.generate(
    27,
    (i) => {
      'chart': ChartData((24 + i).toString(), [
        Data('ICE', (1000 * i).toDouble(), AppColors.iceColor),
        Data('HEV', (2000 * i).toDouble(), AppColors.hevColor),
        Data('PHEV', (3000 * i).toDouble(), AppColors.phevColor),
        Data('BEV', (4000 * i).toDouble(), AppColors.bevColor),
        Data('FCEV', (3000 * i).toDouble(), AppColors.fcevColor),
        Data('MITIGATION', (1000 * (i * 3)).toDouble(),
            AppColors.mitigationColor),
      ]),
      'mitigation': 4000 * i,
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(62.h),
        child: AppBar(
          centerTitle: true,
          forceMaterialTransparency: true,
          title: Padding(
            padding: EdgeInsets.only(top: 24.h),
            child: Image.asset('assets/images/logo.png',
                width: 161.w, height: 45.h),
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
            padding: EdgeInsets.all(20.r),
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
                          title: ChartTitle(
                            text: 'GOVERMENT REGULATION',
                            textStyle: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          primaryXAxis: const CategoryAxis(
                            interval: 1,
                            autoScrollingMode: AutoScrollingMode.end,
                          ),
                          legend: Legend(
                            isVisible: true,
                            position: LegendPosition.bottom,
                            isResponsive: true,
                            textStyle: TextStyle(
                              fontSize: 14.sp,
                            ),
                            toggleSeriesVisibility: true,
                          ),
                          series: <CartesianSeries>[
                            StackedColumnSeries<Map<String, dynamic>, String>(
                              dataSource: chartData,
                              color: AppColors.iceColor,
                              legendItemText: 'ICE',
                              legendIconType: LegendIconType.rectangle,
                              xValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).name,
                              yValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).dataset[0].value,
                            ),
                            StackedColumnSeries<Map<String, dynamic>, String>(
                              dataSource: chartData,
                              color: AppColors.hevColor,
                              legendItemText: 'HEV',
                              legendIconType: LegendIconType.rectangle,
                              xValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).name,
                              yValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).dataset[1].value,
                            ),
                            StackedColumnSeries<Map<String, dynamic>, String>(
                              dataSource: chartData,
                              color: AppColors.phevColor,
                              legendItemText: 'PHEV',
                              legendIconType: LegendIconType.rectangle,
                              xValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).name,
                              yValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).dataset[2].value,
                            ),
                            StackedColumnSeries<Map<String, dynamic>, String>(
                              dataSource: chartData,
                              color: AppColors.bevColor,
                              legendItemText: 'BEV',
                              legendIconType: LegendIconType.rectangle,
                              xValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).name,
                              yValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).dataset[3].value,
                            ),
                            StackedColumnSeries<Map<String, dynamic>, String>(
                              dataSource: chartData,
                              color: AppColors.fcevColor,
                              legendItemText: 'FCEV',
                              legendIconType: LegendIconType.rectangle,
                              xValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).name,
                              yValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).dataset[4].value,
                            ),
                            LineSeries<Map<String, dynamic>, String>(
                              dataSource: chartData,
                              color: AppColors.mitigationColor,
                              legendItemText: 'MITIGATION',
                              xValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).name,
                              yValueMapper: (Map<String, dynamic> data, _) =>
                                  data['mitigation'],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: SfCartesianChart(
                          title: ChartTitle(
                            text: 'ZERO EMISSIONS',
                            textStyle: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          primaryXAxis: const CategoryAxis(
                            interval: 1,
                            autoScrollingMode: AutoScrollingMode.end,
                          ),
                          legend: Legend(
                            isVisible: true,
                            position: LegendPosition.bottom,
                            isResponsive: true,
                            textStyle: TextStyle(
                              fontSize: 14.sp,
                            ),
                            toggleSeriesVisibility: true,
                          ),
                          series: <CartesianSeries>[
                            StackedColumnSeries<Map<String, dynamic>, String>(
                              dataSource: chartData,
                              color: AppColors.iceColor,
                              legendItemText: 'ICE',
                              legendIconType: LegendIconType.rectangle,
                              xValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).name,
                              yValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).dataset[0].value,
                            ),
                            StackedColumnSeries<Map<String, dynamic>, String>(
                              dataSource: chartData,
                              color: AppColors.hevColor,
                              legendItemText: 'HEV',
                              legendIconType: LegendIconType.rectangle,
                              xValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).name,
                              yValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).dataset[1].value,
                            ),
                            StackedColumnSeries<Map<String, dynamic>, String>(
                              dataSource: chartData,
                              color: AppColors.phevColor,
                              legendItemText: 'PHEV',
                              legendIconType: LegendIconType.rectangle,
                              xValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).name,
                              yValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).dataset[2].value,
                            ),
                            StackedColumnSeries<Map<String, dynamic>, String>(
                              dataSource: chartData,
                              color: AppColors.bevColor,
                              legendItemText: 'BEV',
                              legendIconType: LegendIconType.rectangle,
                              xValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).name,
                              yValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).dataset[3].value,
                            ),
                            StackedColumnSeries<Map<String, dynamic>, String>(
                              dataSource: chartData,
                              color: AppColors.fcevColor,
                              legendItemText: 'FCEV',
                              legendIconType: LegendIconType.rectangle,
                              xValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).name,
                              yValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).dataset[4].value,
                            ),
                            LineSeries<Map<String, dynamic>, String>(
                              dataSource: chartData,
                              color: AppColors.mitigationColor,
                              legendItemText: 'MITIGATION',
                              xValueMapper: (Map<String, dynamic> data, _) =>
                                  (data['chart'] as ChartData).name,
                              yValueMapper: (Map<String, dynamic> data, _) =>
                                  data['mitigation'],
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
                Text(
                  'PARAMETER SETUP',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 145.w),
                  padding: EdgeInsets.all(12.r),
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
                          Text(
                            'NRE Ratio Increasing\n(max 2.9%)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            width: 68.w,
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
                          Text(
                            'Ethanol hancement per\nyear max (max 3.6%)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            width: 68.w,
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
                          Text(
                            'Downtrend from 2025\n(max 3%)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            width: 68.w,
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
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            'ICE',
                            style: TextStyle(
                              color: AppColors.yellowColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Uptrend toward 2035\n',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            width: 68.w,
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
                          Text(
                            'HEV',
                            style: TextStyle(
                              color: AppColors.yellowColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Uptrend Untill 2050\n',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: 68.w,
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
                          Text(
                            'PHEV',
                            style: TextStyle(
                              color: AppColors.yellowColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Uptrend until 2050\n',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            width: 68.w,
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
                          Text(
                            'BEV',
                            style: TextStyle(
                              color: AppColors.yellowColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Market growth from\n2040',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            width: 68.w,
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
                          Text(
                            'FCEV',
                            style: TextStyle(
                              color: AppColors.yellowColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 145.w),
                  padding: EdgeInsets.all(12.r),
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
                          Text(
                            'NRE Ratio Increasing\n(max 2.9%)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            width: 150.w,
                            child: Slider(
                              allowedInteraction: SliderInteraction.tapAndSlide,
                              activeColor: AppColors.phevColor,
                              value: 0.8,
                              semanticFormatterCallback: (val) {
                                return '2';
                              },
                              onChanged: (val) {},
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Ethanol hancement per\nyear max (max 3.6%)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            width: 68.w,
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
                    ],
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(296.w, 85.h),
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          RouteUtils().createRoute(const CalculatorScreen()));
                    },
                    child: Text(
                      'CALCULATE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.sp,
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
