import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:florian_software_webapp/models/models.dart';
import 'package:flutter/material.dart';
export 'package:provider/provider.dart';

class PortfolioPageProvider with ChangeNotifier{
  List<Project> projects = [];
  CarouselController carouselController = CarouselController();

  PortfolioPageProvider(){
    getData();
  }

  Future<void> getData() async{
    await FirebaseFirestore.instance.collection('projects')
    .get().then((query) => projects = query.docs.map((doc) => Project.fromData(doc.data())).toList());

    notifyListeners();
  }
}