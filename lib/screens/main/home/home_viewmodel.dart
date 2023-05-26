import 'package:demo_app/models/post.dart';
import 'package:demo_app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';

class HomeViewModel extends FutureViewModel<List<List<Article>>> {

//  setting up services
final _fetchNewsServices = locator<ApiService>();

/// Variable
final GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

List<List<Article>> allNewsCategories = [] ;

@override
  Future <List<List<Article>>> futureToRun()async{
  allNewsCategories.add(await _fetchNewsServices.getHeadlines()); // 0
  allNewsCategories.add(await _fetchNewsServices.getBusinessNews()); // 1
  allNewsCategories.add(await _fetchNewsServices.getSportsNews()); // 2
  allNewsCategories.add(await _fetchNewsServices.getAfricaNews()); // 3
  allNewsCategories.add(await _fetchNewsServices.getStartUpNews()); // 4
return allNewsCategories;
}

String categories = 'business';

  switcher(String category){
    categories = category;
    notifyListeners();
  }


  List<Color> colors = [
    Colors.indigo,
    Colors.white,
    Colors.white,
    Colors.white,

  ];

  // List<Color> bgColors = [
  //   Colors.transparent,
  //   Colors.indigo,
  //   Colors.indigo,
  //   Colors.indigo
  // ];
switchColor(int index){
  if(index == 1){
    colors = [

       Colors.white,
       Colors.indigo,
       Colors.white,
       Colors.white,
    ];
    // bgColors = [
    //     Colors.indigo,
    //     Colors.transparent,
    //     Colors.indigo,
    //     Colors.indigo
    // ];
    notifyListeners();
  }
  else if(index == 2){
    colors = [
      Colors.white,
      Colors.white,
      Colors.indigo,
      Colors.white,
    ];
    // bgColors = [
    //     Colors.indigo,
    //     Colors.indigo,
    //     Colors.transparent,
    //     Colors.indigo
    // ];
    notifyListeners();
  }
  else if(index == 3){
    colors = [
        Colors.white,
        Colors.white,
        Colors.white,
        Colors.indigo,
    ];
    // bgColors = [
    //     Colors.indigo,
    //     Colors.indigo,
    //     Colors.indigo,
    //     Colors.transparent
    // ];
    notifyListeners();
  }
  else{
    colors = [
       Colors.indigo,
       Colors.white,
       Colors.white,
       Colors.white,
    ];
    // bgColors = [
    //     Colors.transparent,
    //     Colors.indigo,
    //     Colors.indigo,
    //     Colors.indigo
    // ];
    notifyListeners();
  }
}


}

