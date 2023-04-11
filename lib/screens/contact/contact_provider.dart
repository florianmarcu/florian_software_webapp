import 'package:flutter/material.dart';
export 'package:provider/provider.dart';

class ContactPageProvider with ChangeNotifier{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Map<String, dynamic> formData = {
    "name": "",
    "email": "",
    "company": "",
    "phone_number": "",
    "message": ""
  };

  void updateFormData(String field, String data){
    formData[field] = data;

    notifyListeners();
  }

  Future<bool> sendMessage() async{
    return true;
  }

}