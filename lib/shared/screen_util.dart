import 'package:flutter/material.dart';

enum DeviceType { desktop, mobile, tablet }

class ScreenUtil {
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
  }

  static DeviceType getDeviceType(BuildContext context) {
    // fixed width changes with oreintation
    final deviceWidth = MediaQuery.of(context).size.shortestSide;

    if (deviceWidth > 600) {
      return DeviceType.tablet;
    } else {
      return DeviceType.mobile;
    }
  }
}