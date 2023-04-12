import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FooterProvider with ChangeNotifier{

  /// launches social or legal url
  Future<bool> launchSocialOrLegalUrl(String social) async{
    bool res = true;
    String? url;

    switch(social){
      case "instagram":
        url = "";
      break;
      case "facebook":
        url = "";
      break;
      case "email":
        url = "";
      break;
      case "privacy-policy":
        url = "";
      break;
      case "terms-and-conditions":
        url = "";
      break;
      case "contact":
        url = "";
      break;
    }

    if(url != null){
      if(await canLaunchUrlString(url)){
        res = await launchUrlString(url);
      }
    }

    return res;
  }
}