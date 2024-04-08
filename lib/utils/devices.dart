import 'package:flutter/material.dart';

class Devices {
  static bool isMobilePhone(BuildContext context) {
    var deviceFormFactor = MediaQuery.of(context).size.shortestSide;
    return deviceFormFactor < 600; // SmartPhone
    // deviceFormFactor > 600 = 'tablet';
    // deviceFormFactor > 900 = 'Desktop'
    // Source: https://docs.flutter.dev/ui/layout/responsive/building-adaptive-apps
  }
}
