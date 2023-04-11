import 'package:flutter/material.dart';

const int smallScreenSize = 360;
const int mediumScreenSize = 768;
const int largeScreenSize = 1366;

/// Parent widget for every 'Screen' in our app
class ResponsiveWidget extends StatelessWidget {
  final Widget? smallScreen;
  final Widget? mediumScreen;
  final Widget largeScreen;

  static bool isSmallScreen(BuildContext context) => MediaQuery.of(context).size.width < mediumScreenSize;
  static bool isMediumScreen(BuildContext context) => MediaQuery.of(context).size.width >= mediumScreenSize && MediaQuery.of(context).size.width < largeScreenSize;
  static bool isLargeScreen(BuildContext context) => MediaQuery.of(context).size.width >= largeScreenSize;

  const ResponsiveWidget({super.key, required this.largeScreen, required this.mediumScreen, required this.smallScreen,});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        double width = constraints.maxWidth;
        /// LARGE SCREEN
        if(width >= largeScreenSize){
          return largeScreen;
        }
        /// MEDIUM SCREEN
        else if(width >= mediumScreenSize){
          return mediumScreen ?? largeScreen;
        }
        /// SMALL SCREEN
        else{
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}