import 'dart:convert';
import 'dart:developer';

import 'package:carbon_emissions/utils/double_extension.dart';
import 'package:flutter/material.dart';

enum SliderType {
  ice,
  hve,
  phve,
  bev,
  fcev,
  nre,
  ethanol,
}

enum ParameterSetupType {
  nre,
  ethanol,
  ice,
  hve,
  phve,
  bev,
  fcev,
}

class CalculatorProvider extends ChangeNotifier {
  double iceSlider = 0.87;
  double hveSlider = 0.13;
  double phveSlider = 0.0;
  double bevSlider = 0.0;
  double fcevSlider = 0.0;
  double nreSlider = 0.23;
  double ethanolSlider = 0.05;

  double nre = 2.9;
  double ethanol = 3.6;
  double ice = 3.35;
  double hev = 1;
  double phev = 1;
  double bev = 1;
  double fcev = 1;
  List<int> phveDef = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15
  ];

  List<int> fcevDef = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
  ];
  List<double> defaultValues = [
    408985.0,
    423335.0,
    437830.0,
    478423.0,
    481797.0,
    507068.0,
    533725.0,
    581760.0,
    634119.0,
    691189.0,
    753396.0,
    821202.0,
    895110.0,
    975670.0,
    1063481.0,
    1159194.0,
    1263521.0,
    1377238.0,
    1501190.0,
    1636297.0,
    1783563.0,
    1944084.0,
    2119052.0,
    2309766.0,
    2517645.0,
    2744233.0,
    2991214.0
  ];

  final consAveIceTtW = 142.5;
  final consAveHevTtW = 93;

  final consAveIceWtW = 160.5754098;
  final consAveHevWtW = 105.0619048;

  List<Map<String, dynamic>> calculateTableData = [];

  void setSlider(SliderType type, double distance) {
    switch (type) {
      case SliderType.ice:
        iceSlider = distance;
        break;

      case SliderType.hve:
        hveSlider = distance;
        break;

      case SliderType.phve:
        phveSlider = distance;
        break;

      case SliderType.bev:
        bevSlider = distance;
        break;

      case SliderType.fcev:
        fcevSlider = distance;
        break;

      case SliderType.nre:
        nreSlider = distance;
        break;

      case SliderType.ethanol:
        ethanolSlider = distance;
        break;
    }
    notifyListeners();
  }

  void calculate() {
    calculateTableData.clear();
    double tempPhve = ((phveDef[0] / 100));
    double tempFcev = ((fcevDef[0] / 100));
    double tempIce = iceSlider;
    double tempHve = hveSlider;
    double tempBve = 0;
    double tempNreMix = nreSlider;
    double tempBioFuel = ethanolSlider;
    double tempIceHev = 1 - ethanolSlider;
    double tempBecPhev = 1 - nreSlider;

    double tempEgEfficientcy = 1;
    double tempAveTTWIce = consAveIceTtW * tempIceHev * tempEgEfficientcy;
    double tempAveTTWHev = consAveHevTtW * tempIceHev * tempEgEfficientcy;
    double tempAveTTWPhev = 60 * tempIceHev * tempEgEfficientcy;
    double tempAveTTWBEV = 0;
    double tempAveTTWFCEV = 0;
    double tempAveTTWAverage = 200 * tempIceHev;

    double tempAveWtWIce = consAveIceWtW * tempIceHev * tempEgEfficientcy;
    double tempAveWtWHev = consAveHevWtW * tempIceHev * tempEgEfficientcy;
    double tempAveWtWPhev =
        ((76 * tempBecPhev) + (60 * tempIceHev)) * tempEgEfficientcy;
    double tempAveWtWBEV = 110 * tempBecPhev;
    double tempAveWtWFCEV = 0;
    double tempAveWtWAverage = 225;

    double tempMitigation = (((tempAveWtWIce * (tempIce * defaultValues[0])) +
                (tempAveWtWHev * (hveSlider * defaultValues[0])) +
                (tempAveWtWPhev * (tempPhve * defaultValues[0])) +
                (tempAveWtWBEV * (tempBve * defaultValues[0])) +
                (tempAveWtWFCEV * (tempFcev * defaultValues[0]))) *
            15000) /
        1000000000;

    double tempBaU = defaultValues[0] * tempAveWtWAverage * 15000 / 1000000000;
    double tempCarbonCap = (1 - 0.3189) * tempBaU;

    double tempTTWEmissions = ((tempAveTTWIce * (tempIce * defaultValues[0])) +
        (tempAveTTWHev * (hveSlider * defaultValues[0])) +
        (tempAveTTWPhev * (tempPhve * defaultValues[0])) +
        (tempAveTTWBEV * (tempBve * defaultValues[0])) +
        (tempAveTTWFCEV * (tempFcev * defaultValues[0])));

    double tempWtWEmissions = ((tempAveWtWIce * (tempIce * defaultValues[0])) +
        (tempAveWtWHev * (hveSlider * defaultValues[0])) +
        (tempAveWtWPhev * 0) +
        (tempAveWtWBEV * 0) +
        (tempAveWtWFCEV * 0));

    int starYear = 23;

    double aveTTW = tempTTWEmissions / defaultValues[0];
    double aveWtW = tempWtWEmissions / defaultValues[0];

    double tempResultIce = 0;
    double tempResultHev = 0;
    double tempResultBev = 0;
    double tempResultFcev = 0;
    double tempResultPhev = 0;

    for (int i = 0; i < 27; i++) {
      starYear = starYear + 1;

      if (i != 0) {
        tempPhve = ((phveDef[i] / 100));
        tempFcev = ((fcevDef[i] / 100));
        if (i < 12) {
          tempHve = double.parse((tempHve + hev).toStringAsFixed(5));
        } else {
          tempHve = double.parse((tempHve - hev).toStringAsFixed(5));
        }
        tempIce = double.parse((tempIce - ice).toStringAsFixed(5));
        tempBve = double.parse(
            (1 - tempIce - tempHve - tempPhve - tempFcev).toStringAsFixed(5));
      }

      tempResultIce = (tempIce * defaultValues[i]);
      tempResultHev = (tempHve * defaultValues[i]);
      tempResultPhev = (tempPhve * defaultValues[i]);
      tempResultFcev = (tempFcev * defaultValues[i]);
      tempResultBev = (tempBve * defaultValues[i]);

      if (i != 0) {
        tempNreMix = tempNreMix + nre;
        tempBioFuel = tempBioFuel + ethanol;

        tempIceHev = 1 - tempBioFuel;

        tempBecPhev = 1 - tempNreMix;

        tempEgEfficientcy = tempEgEfficientcy - 0.004;

        tempAveTTWIce = consAveIceTtW * tempIceHev * tempEgEfficientcy;

        tempAveTTWHev = consAveHevTtW * tempIceHev * tempEgEfficientcy;

        tempAveTTWPhev = 60 * tempIceHev * tempEgEfficientcy;

        tempAveTTWAverage = 200 * tempIceHev;

        tempAveWtWIce = consAveIceWtW * tempIceHev * tempEgEfficientcy;
        tempAveWtWHev = consAveHevWtW * tempIceHev * tempEgEfficientcy;
        tempAveWtWPhev =
            ((76 * tempBecPhev) + (60 * tempIceHev)) * tempEgEfficientcy;
        tempAveWtWBEV = 110 * tempBecPhev;
        tempAveWtWFCEV = 0;

        tempMitigation = ((tempAveWtWIce * tempResultIce) +
                (tempAveWtWHev * tempResultHev) +
                (tempAveWtWPhev * tempResultPhev) +
                (tempAveWtWBEV * tempResultBev) +
                (tempAveWtWFCEV * tempResultFcev)) *
            15000 /
            1000000000;

        tempBaU = defaultValues[i] * tempAveWtWAverage * 15000 / 1000000000;
        tempCarbonCap = (1 - 0.3189) * tempBaU;

        tempTTWEmissions = ((tempAveTTWIce * tempResultIce) +
            (tempAveTTWHev * tempResultHev) +
            (tempAveTTWPhev * tempResultPhev) +
            (tempAveTTWBEV * tempResultBev) +
            (tempAveTTWFCEV * tempResultFcev));

        aveTTW = tempTTWEmissions / defaultValues[i];

        tempWtWEmissions = ((tempAveWtWIce * tempResultIce) +
            (tempAveWtWHev * tempResultHev) +
            (tempAveWtWPhev * 0) +
            (tempAveWtWBEV * 0) +
            (tempAveWtWFCEV * 0));

        aveWtW = tempWtWEmissions / defaultValues[i];
      }
      calculateTableData.add({
        'year': starYear,
        'ice': tempResultIce.notNegative,
        'hve': tempResultHev.notNegative,
        'phve': tempResultPhev.notNegative,
        'fcev': tempResultFcev.notNegative,
        'bev': tempResultBev.notNegative,
        'mitigation': tempMitigation,
        'bau': tempBaU,
        'carbonCap': tempCarbonCap,
        'aveTTW': aveTTW,
        'aveWTW': aveWtW,
      });
    }

    notifyListeners();
  }

  void setParameter(ParameterSetupType type, double val) {
    final value = (val / 100);
    switch (type) {
      case ParameterSetupType.nre:
        nre = value;
        break;
      case ParameterSetupType.ethanol:
        ethanol = value;
        break;
      case ParameterSetupType.ice:
        ice = value;
        break;

      case ParameterSetupType.hve:
        hev = value;
        break;

      case ParameterSetupType.phve:
        phev = value;
        break;

      case ParameterSetupType.bev:
        bev = value;
        break;

      case ParameterSetupType.fcev:
        fcev = value;
        break;
    }
    notifyListeners();
  }
}