import 'package:carbon_emissions/calculator_provider.dart';
import 'package:carbon_emissions/onboarding_screen.dart';
import 'package:carbon_emissions/theme/colors.dart';
import 'package:carbon_emissions/utils/common_loading_dialog.dart';
import 'package:carbon_emissions/utils/max_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalculatorProvider(),
      builder: (_, __) => _CalculatorScreen(),
    );
  }
}

class _CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CalculatorProvider>();
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
            child: SingleChildScrollView(
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
                              text:
                                  'ID Goverment Target (flatten on 2030 onward)',
                              textStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            zoomPanBehavior: ZoomPanBehavior(
                                enablePinching: true,
                                enableDoubleTapZooming: true,
                                enablePanning: true,
                                enableSelectionZooming: true),
                            primaryXAxis: const CategoryAxis(),
                            primaryYAxis: const NumericAxis(
                              minimum: 0,
                              enableAutoIntervalOnZooming: true,
                            ),
                            tooltipBehavior: TooltipBehavior(enable: true),
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
                                dataSource: vm.calculateTableData,
                                color: AppColors.iceColor,
                                legendItemText: 'ICE',
                                legendIconType: LegendIconType.rectangle,
                                xValueMapper: (Map<String, dynamic> data, _) =>
                                    data['year'].toString(),
                                yValueMapper: (Map<String, dynamic> data, _) =>
                                    data['ice'],
                              ),
                              StackedColumnSeries<Map<String, dynamic>, String>(
                                dataSource: vm.calculateTableData,
                                color: AppColors.hevColor,
                                legendItemText: 'HEV',
                                legendIconType: LegendIconType.rectangle,
                                xValueMapper: (Map<String, dynamic> data, _) =>
                                    data['year'].toString(),
                                yValueMapper: (Map<String, dynamic> data, _) =>
                                    data['hve'],
                              ),
                              StackedColumnSeries<Map<String, dynamic>, String>(
                                dataSource: vm.calculateTableData,
                                color: AppColors.phevColor,
                                legendItemText: 'PHEV',
                                legendIconType: LegendIconType.rectangle,
                                xValueMapper: (Map<String, dynamic> data, _) =>
                                    data['year'].toString(),
                                yValueMapper: (Map<String, dynamic> data, _) =>
                                    data['phev'],
                              ),
                              StackedColumnSeries<Map<String, dynamic>, String>(
                                dataSource: vm.calculateTableData,
                                color: AppColors.bevColor,
                                legendItemText: 'BEV',
                                legendIconType: LegendIconType.rectangle,
                                xValueMapper: (Map<String, dynamic> data, _) =>
                                    data['year'].toString(),
                                yValueMapper: (Map<String, dynamic> data, _) =>
                                    data['bev'],
                              ),
                              StackedColumnSeries<Map<String, dynamic>, String>(
                                dataSource: vm.calculateTableData,
                                color: AppColors.fcevColor,
                                legendItemText: 'FCEV',
                                legendIconType: LegendIconType.rectangle,
                                xValueMapper: (Map<String, dynamic> data, _) =>
                                    data['year'].toString(),
                                yValueMapper: (Map<String, dynamic> data, _) =>
                                    data['fcev'],
                              ),
                              LineSeries<Map<String, dynamic>, String>(
                                dataSource: vm.calculateTableData,
                                color: Colors.green[900],
                                legendItemText: 'Mitigation',
                                xValueMapper: (Map<String, dynamic> data, _) =>
                                    data['year'].toString(),
                                yValueMapper: (Map<String, dynamic> data, _) {
                                  return data['mitigation'];
                                },
                              ),
                              LineSeries<Map<String, dynamic>, String>(
                                dataSource: vm.calculateTableData,
                                color: Colors.blue[900],
                                legendItemText: 'BaU',
                                xValueMapper: (Map<String, dynamic> data, _) =>
                                    data['year'].toString(),
                                yValueMapper: (Map<String, dynamic> data, _) {
                                  return data['bau'];
                                },
                              ),
                              LineSeries<Map<String, dynamic>, String>(
                                dataSource: vm.calculateTableData,
                                color: Colors.red[900],
                                legendItemText: 'CarbonCap (31.89%)',
                                xValueMapper: (Map<String, dynamic> data, _) =>
                                    data['year'].toString(),
                                yValueMapper: (Map<String, dynamic> data, _) {
                                  return data['carbonCap'];
                                },
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
                              text: 'TMC Target (average TtW and WtW on 2030)',
                              textStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            zoomPanBehavior: ZoomPanBehavior(
                                enablePinching: true,
                                enableDoubleTapZooming: true,
                                enablePanning: true,
                                enableSelectionZooming: true),
                            primaryXAxis: const CategoryAxis(),
                            enableSideBySideSeriesPlacement: true,
                            primaryYAxis: const NumericAxis(
                              minimum: 0,
                              enableAutoIntervalOnZooming: true,
                            ),
                            tooltipBehavior: TooltipBehavior(enable: true),
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
                                dataSource: vm.calculateTableData,
                                color: AppColors.iceColor,
                                legendItemText: 'ICE',
                                legendIconType: LegendIconType.rectangle,
                                xValueMapper: (Map<String, dynamic> data, _) =>
                                    data['year'].toString(),
                                yValueMapper: (Map<String, dynamic> data, _) =>
                                    data['ice'],
                              ),
                              StackedColumnSeries<Map<String, dynamic>, String>(
                                dataSource: vm.calculateTableData,
                                color: AppColors.hevColor,
                                legendItemText: 'HEV',
                                legendIconType: LegendIconType.rectangle,
                                xValueMapper: (Map<String, dynamic> data, _) =>
                                    data['year'].toString(),
                                yValueMapper: (Map<String, dynamic> data, _) =>
                                    data['hve'],
                              ),
                              StackedColumnSeries<Map<String, dynamic>, String>(
                                dataSource: vm.calculateTableData,
                                color: AppColors.phevColor,
                                legendItemText: 'PHEV',
                                legendIconType: LegendIconType.rectangle,
                                xValueMapper: (Map<String, dynamic> data, _) =>
                                    data['year'].toString(),
                                yValueMapper: (Map<String, dynamic> data, _) =>
                                    data['phev'],
                              ),
                              StackedColumnSeries<Map<String, dynamic>, String>(
                                dataSource: vm.calculateTableData,
                                color: AppColors.bevColor,
                                legendItemText: 'BEV',
                                legendIconType: LegendIconType.rectangle,
                                xValueMapper: (Map<String, dynamic> data, _) =>
                                    data['year'].toString(),
                                yValueMapper: (Map<String, dynamic> data, _) =>
                                    data['bev'],
                              ),
                              StackedColumnSeries<Map<String, dynamic>, String>(
                                dataSource: vm.calculateTableData,
                                color: AppColors.fcevColor,
                                legendItemText: 'FCEV',
                                legendIconType: LegendIconType.rectangle,
                                xValueMapper: (Map<String, dynamic> data, _) =>
                                    data['year'].toString(),
                                yValueMapper: (Map<String, dynamic> data, _) =>
                                    data['fcev'],
                              ),
                              LineSeries<Map<String, dynamic>, String>(
                                dataSource: vm.calculateTableData,
                                color: Colors.green[900],
                                legendItemText: 'Ave TtW',
                                xValueMapper: (Map<String, dynamic> data, _) =>
                                    data['year'].toString(),
                                yValueMapper: (Map<String, dynamic> data, _) {
                                  return data['aveTTW'];
                                },
                              ),
                              LineSeries<Map<String, dynamic>, String>(
                                dataSource: vm.calculateTableData,
                                color: Colors.blue[900],
                                legendItemText: 'Ave WtW',
                                xValueMapper: (Map<String, dynamic> data, _) =>
                                    data['year'].toString(),
                                yValueMapper: (Map<String, dynamic> data, _) {
                                  return data['aveWTW'];
                                },
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
                    margin: EdgeInsets.symmetric(horizontal: 80.w),
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
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^(\d+)?\.?\d{0,2}')),
                                  MaxValueInputFormatter(2.9),
                                ],
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    suffixText: '%'),
                                textAlign: TextAlign.center,
                                onChanged: (val) {
                                  vm.setParameter(ParameterSetupType.nre,
                                      double.parse(val));
                                },
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              '\u2022 NRE : New Renewable Energy ',
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.w700),
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
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^(\d+)?\.?\d{0,2}')),
                                  MaxValueInputFormatter(3.6),
                                ],
                                textAlign: TextAlign.center,
                                onChanged: (val) {
                                  vm.setParameter(ParameterSetupType.ethanol,
                                      double.parse(val));
                                },
                                keyboardType: TextInputType.number,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Downtrend from 2025\n(max 3.4%)',
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
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^(\d+)?\.?\d{0,2}')),
                                  MaxValueInputFormatter(3.4),
                                ],
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    suffixText: '%'),
                                textAlign: TextAlign.center,
                                onChanged: (val) {
                                  vm.setParameter(ParameterSetupType.ice,
                                      double.parse(val));
                                },
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
                                onChanged: (val) {
                                  vm.setParameter(ParameterSetupType.hve,
                                      double.parse(val));
                                },
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
                                onChanged: (val) {
                                  vm.setParameter(ParameterSetupType.phve,
                                      double.parse(val));
                                },
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
                                onChanged: (val) {
                                  vm.setParameter(ParameterSetupType.bev,
                                      double.parse(val));
                                },
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
                                onChanged: (val) {
                                  vm.setParameter(ParameterSetupType.fcev,
                                      double.parse(val));
                                },
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
                  Text(
                    'Technology Ratio (start from 2024)',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 80.w),
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'ICE',
                              style: TextStyle(
                                color: AppColors.phevColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                              ),
                            ),
                            SizedBox(
                              width: 150.w,
                              child: Slider(
                                allowedInteraction:
                                    SliderInteraction.tapAndSlide,
                                activeColor: AppColors.phevColor,
                                min: 0,
                                max: 1,
                                divisions: 100,
                                onChanged: (_) {
                                  context
                                      .read<CalculatorProvider>()
                                      .setSlider(SliderType.ice, _);
                                },
                                value: vm.iceSlider ?? 0,
                              ),
                            ),
                            Text(
                              '${((vm.iceSlider ?? 0) * 100).ceil()}%',
                              style: TextStyle(
                                color: AppColors.phevColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'HVE',
                              style: TextStyle(
                                color: AppColors.phevColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                              ),
                            ),
                            SizedBox(
                              width: 150.w,
                              child: Slider(
                                allowedInteraction:
                                    SliderInteraction.tapAndSlide,
                                activeColor: AppColors.phevColor,
                                min: 0,
                                max: 1,
                                divisions: 100,
                                onChanged: (_) {
                                  context
                                      .read<CalculatorProvider>()
                                      .setSlider(SliderType.hve, _);
                                },
                                value: vm.hveSlider ?? 0,
                              ),
                            ),
                            Text(
                              '${((vm.hveSlider ?? 0) * 100).ceil()}%',
                              style: TextStyle(
                                color: AppColors.phevColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'PHVE',
                              style: TextStyle(
                                color: AppColors.phevColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                              ),
                            ),
                            SizedBox(
                              width: 150.w,
                              child: Slider(
                                allowedInteraction:
                                    SliderInteraction.tapAndSlide,
                                activeColor: AppColors.phevColor,
                                min: 0,
                                max: 1,
                                divisions: 100,
                                onChanged: (_) {
                                  context
                                      .read<CalculatorProvider>()
                                      .setSlider(SliderType.phve, _);
                                },
                                value: vm.phveSlider ?? 0,
                              ),
                            ),
                            Text(
                              '${((vm.phveSlider ?? 0) * 100).ceil()}%',
                              style: TextStyle(
                                color: AppColors.phevColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'BEV',
                              style: TextStyle(
                                color: AppColors.phevColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                              ),
                            ),
                            SizedBox(
                              width: 150.w,
                              child: Slider(
                                allowedInteraction:
                                    SliderInteraction.tapAndSlide,
                                activeColor: AppColors.phevColor,
                                min: 0,
                                max: 1,
                                divisions: 100,
                                onChanged: (_) {
                                  context
                                      .read<CalculatorProvider>()
                                      .setSlider(SliderType.bev, _);
                                },
                                value: vm.bevSlider ?? 0,
                              ),
                            ),
                            Text(
                              '${((vm.bevSlider ?? 0) * 100).ceil()}%',
                              style: TextStyle(
                                color: AppColors.phevColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'FCEV',
                              style: TextStyle(
                                color: AppColors.phevColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                              ),
                            ),
                            SizedBox(
                              width: 150.w,
                              child: Slider(
                                allowedInteraction:
                                    SliderInteraction.tapAndSlide,
                                activeColor: AppColors.phevColor,
                                min: 0,
                                max: 1,
                                divisions: 100,
                                onChanged: (_) {
                                  context
                                      .read<CalculatorProvider>()
                                      .setSlider(SliderType.fcev, _);
                                },
                                value: vm.fcevSlider ?? 0,
                              ),
                            ),
                            Text(
                              '${((vm.fcevSlider ?? 0) * 100).ceil()}%',
                              style: TextStyle(
                                color: AppColors.phevColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Ethanol Percentage',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.w),
                            padding: EdgeInsets.all(12.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 150.w,
                                  child: Slider(
                                    allowedInteraction:
                                        SliderInteraction.tapAndSlide,
                                    activeColor: AppColors.hevColor,
                                    min: 0,
                                    max: 1,
                                    divisions: 100,
                                    onChanged: (_) {
                                      context
                                          .read<CalculatorProvider>()
                                          .setSlider(SliderType.ethanol, _);
                                    },
                                    value: vm.ethanolSlider ?? 0,
                                  ),
                                ),
                                Text(
                                  '${((vm.ethanolSlider ?? 0) * 100).ceil()}%',
                                  style: TextStyle(
                                    color: AppColors.hevColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'New Renewable Energy Ratio',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.w),
                            padding: EdgeInsets.all(12.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 150.w,
                                  child: Slider(
                                    allowedInteraction:
                                        SliderInteraction.tapAndSlide,
                                    activeColor: AppColors.fcevColor,
                                    min: 0,
                                    max: 1,
                                    divisions: 100,
                                    onChanged: (_) {
                                      context
                                          .read<CalculatorProvider>()
                                          .setSlider(SliderType.nre, _);
                                    },
                                    value: vm.nreSlider ?? 0,
                                  ),
                                ),
                                Text(
                                  '${((vm.nreSlider ?? 0) * 100).ceil()}%',
                                  style: TextStyle(
                                    color: AppColors.fcevColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(0.6.sw, 85.h),
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: vm.ice == null ||
                              vm.fcev == null ||
                              vm.bev == null ||
                              vm.ethanol == null ||
                              vm.hev == null ||
                              vm.phev == null ||
                              vm.nre == null
                          ? null
                          : () {
                              LoadingDialog.runWithLoading(context, () {
                                return context
                                    .read<CalculatorProvider>()
                                    .calculate();
                              }).then((value) {
                                if (value) {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return Dialog(
                                          backgroundColor: Colors.transparent,
                                          child: Wrap(
                                            children: [
                                              Center(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: Colors.white,
                                                  ),
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.symmetric(
                                                    horizontal: 0.25.sw,
                                                  ),
                                                  padding: EdgeInsets.all(
                                                    24.r,
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/win.png',
                                                        width: 360,
                                                        height: 360,
                                                      ),
                                                      SizedBox(
                                                        height: 18.h,
                                                      ),
                                                      Text(
                                                        'CONGRATULATION !!!',
                                                        style: TextStyle(
                                                          fontSize: 24.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 14.h,
                                                      ),
                                                      Text(
                                                        'YOU ARE GOOD PRODUCT PLANNER LETS KEEP CONTINUE AND ENJOY THE PROCESS TOWARD CARBON NEUTRAL',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 20.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 32.h,
                                                      ),
                                                      ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            fixedSize: Size(
                                                                296.w, 85.h),
                                                            backgroundColor:
                                                                AppColors
                                                                    .primaryColor,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pushAndRemoveUntil(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (_) =>
                                                                        const OnboardingScreen()),
                                                                (Route<dynamic>
                                                                        route) =>
                                                                    false);
                                                          },
                                                          child: Text(
                                                            'CLOSE',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 32.sp,
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return Dialog(
                                          backgroundColor: Colors.transparent,
                                          child: Wrap(
                                            children: [
                                              Center(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: Colors.white,
                                                  ),
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.symmetric(
                                                    horizontal: 0.25.sw,
                                                  ),
                                                  padding: EdgeInsets.all(
                                                    24.r,
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/failed.png',
                                                        width: 360,
                                                        height: 360,
                                                      ),
                                                      SizedBox(
                                                        height: 18.h,
                                                      ),
                                                      Text(
                                                        'EXCUSE ME',
                                                        style: TextStyle(
                                                          fontSize: 24.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 14.h,
                                                      ),
                                                      Text(
                                                        'YOU SHOULD BE MORE CHALLENGED IN DEVELOPING YOUR STRATEGY. YOU CAN DISCUSS WITH MARKETING TO BE MORE OPTIMISTIC IN PROMOTING ELECTRIC VEHICLES.AND LET\'S TOGETHER ENCOURAGE OUR GOVERNMENT TO IMMEDIATELY IN MORE ENVIRONMENTALLY FRIENDLY ENERGY READINESS',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 20.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 32.h,
                                                      ),
                                                      ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            fixedSize: Size(
                                                                296.w, 85.h),
                                                            backgroundColor:
                                                                AppColors
                                                                    .primaryColor,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            'CLOSE',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 32.sp,
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                }
                              });
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
      ),
    );
  }
}
