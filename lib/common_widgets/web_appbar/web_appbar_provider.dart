import 'package:florian_software_webapp/main.dart';
import 'package:flutter/material.dart';
export 'package:provider/provider.dart';

class WebAppbarProvider with ChangeNotifier{
  String currentRouteName = goRouterObserver.currentRouteName;

  Map<String, String> pages = {
    '': 'Home',
    'about': 'About us',
    'portfolio': 'Portfolio',
    'contact': 'Contact',
  };

  updateCurrentRouteName(String path){
    currentRouteName = path;

    notifyListeners();
  }

}