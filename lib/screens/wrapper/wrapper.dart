import 'package:florian_software_webapp/common_widgets/end_drawer/end_drawer.dart';
import 'package:florian_software_webapp/common_widgets/web_appbar/web_appbar.dart';
import 'package:florian_software_webapp/screens/wrapper/wrapper_provider.dart';
import 'package:florian_software_webapp/utils/utils.dart';
import 'package:flutter/material.dart';

///Wrapping class of the website's home
///Reasons for moving the wrapping scaffold inside a separate widget:
/// - workaround for the 'menu' actions icon that doesn't go away in large screen
///Consists of:
/// - a persistent Appbar at the top (shell route) 
/// - a 'body' that changes with each route (go route)
class Wrapper extends StatelessWidget {

  final Widget child;

  Wrapper(this.child);

  Widget largeScreen(BuildContext context, WrapperProvider provider){
    return Scaffold(
      key: provider.endDrawerKey,
      extendBodyBehindAppBar: true,
      appBar: WebAppBar(),
      body: Center(
        child: child,
      ),
    );
  }

  Widget smallScreen(BuildContext context, WrapperProvider provider){
    return Scaffold(
      key: provider.endDrawerKey,
      extendBodyBehindAppBar: true,
      endDrawer: EndDrawer(provider.pages),
      appBar: WebAppBar(),
      body: Center(
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<WrapperProvider>();
    return ResponsiveWidget(
      largeScreen: largeScreen(context, provider),
      mediumScreen: null,
      smallScreen: smallScreen(context, provider),
    );
  }
}