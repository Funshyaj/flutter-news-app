import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../services/auth_service.dart';

class LoginViewModel extends BaseViewModel {
  //set up for navigation
  final _navigationService = locator<NavigationService>();

//  set up for auth services
  final _authenticationService = locator<AuthenticationService>();


  String title = 'not updated';
  TextEditingController username= TextEditingController();
  TextEditingController password = TextEditingController();

  void doSomething() {
    title += ' updated ';
    // this will call the builder defined in the view file and rebuild the ui using
    // the update version of the model.
   rebuildUi();
  }


  login(){
    // print(username.text);
    // print(password.text);
    _authenticationService.login(username.text, password.text);
  }

  clear() async{
    var box = await Hive.openBox('userDatabase');
    // box.clear();
    print('db is cleared');
  }

  void navToSignUp(){
    _navigationService.navigateTo(Routes.signUpView);
  }
}