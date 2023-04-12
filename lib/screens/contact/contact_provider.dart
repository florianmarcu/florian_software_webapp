import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
export 'package:provider/provider.dart';

class ContactPageProvider with ChangeNotifier{
  bool sent = false;
  bool isSending = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Map<String, TextEditingController> controllers = {
    "name": TextEditingController(text: ""),
    "email": TextEditingController(text: ""),
    "company": TextEditingController(text: ""),
    "phone_number": TextEditingController(text: ""),
    "message": TextEditingController(text: ""),
  };
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
    _sending();

    var res = true;

    if(formKey.currentState != null){
      if(formKey.currentState!.validate()){
        await FirebaseFirestore.instance.collection('messages')
        .doc()
        .set(
          formData,
          SetOptions(merge: true)
        );
        formKey.currentState ?? formKey.currentState!.reset();
        resetForm();
        sent = true;
      }
      else res = false;
    }

    _sending();
    notifyListeners();

    return res;
  }

  void resetForm(){
    formData = {
      "name": "",
      "email": "",
      "company": "",
      "phone_number": "",
      "message": ""
    };

    controllers.forEach((key, value) => value.clear());

    notifyListeners();
  }

  Future<bool> launchCallBooking() async{
    var res = false;
    if(await canLaunchUrlString("https://flostacks.youcanbook.me/")){
      res = await launchUrlString("https://flostacks.youcanbook.me/");
    }
    return res;
  }

  String? validateFormField(String field, String? value){
    var res;
    switch(field){
      case 'name': 
        if(value == null || value == "")
          res = "Enter a valid name";
      break;
      case 'email': 
        if(value == null || value == "" || !value.contains("@") || !value.contains("."))
          res = "Enter a valid email";
      break;
      case 'message': 
        if(value == null || value == "")
          res = "Enter a valid message";
      break;
    }
    return res;
  }

  _sending(){
    isSending = !isSending;
  
    notifyListeners();
  }

}