import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../services/auth_services.dart';

class LoginViewModel extends BaseViewModel {
  //set up for navigation
  final _navigationService = locator<NavigationService>();

//  set up for auth services
  final _authenticationService = locator<AuthenticationService>();


  bool wrongPassword = false;
  TextEditingController username= TextEditingController();
  TextEditingController password = TextEditingController();

  login(){
    var result = _authenticationService.login(username.text, password.text);
     if(!result) {
       wrongPassword = true;
     rebuildUi();
     }

     else {
       // _navigationService.navigateTo(Routes.welcomeView);
       print('ready to take you to home page');
       wrongPassword = false;
       _navigationService.navigateTo(Routes.homeView);
       rebuildUi();

     }

     }

  // clear() async{
  //   var box = await Hive.openBox('userDatabase');
  //   // box.clear();
  //   print('db is cleared');
  // }

  void navToSignUp(){
    _navigationService.navigateTo(Routes.signUpView);
  }
}