import 'package:flutter/material.dart';

class AppResponsive {
  static const mobileBreakpoint = 800;

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  static bool isWeb(BuildContext context) {
    return MediaQuery.of(context).size.width >= mobileBreakpoint;
  }

  static Widget adaptiveBuilder({
    required BuildContext context,
    required Widget mobile,
    required Widget web,
  }) {
    return isMobile(context) ? mobile : web;
  }

  static EdgeInsets symmetricPadding({
    required BuildContext context,
    double mobileHorizontal = 16.0,
    double mobileVertical = 16.0,
    double webHorizontal = 32.0,
    double webVertical = 32.0,
  }) {
    return isMobile(context)
        ? EdgeInsets.symmetric(
            horizontal: mobileHorizontal,
            vertical: mobileVertical,
          )
        : EdgeInsets.symmetric(
            horizontal: webHorizontal,
            vertical: webVertical,
          );
  }
}
