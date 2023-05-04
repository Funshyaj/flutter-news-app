import 'dart:convert';

import 'package:demo_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../services/auth_service.dart';


class SignUpViewModel extends BaseViewModel{



  //set up for navigation
  final _navigationService = locator<NavigationService>();

//  set up for auth services
  final _authenticationService = locator<AuthenticationService>();

//creating a controllers
TextEditingController fullnameController = TextEditingController();
TextEditingController usernameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

test() async{
   Box others = Hive.box('otherData');

   bool firstTime = await others.get('firstTime', defaultValue: true);
print(firstTime.toString());

  Box users = Hive.box<UserModel>('userdatabase');
print(users.containsKey('Funshy'));
}



signUp()async{
//  extra validation
if((fullnameController.text != '') && (usernameController.text != '') && (emailController.text != '')
    && (passwordController.text != '') ) {
  print('ready to save user');
  print(passwordController.text);
//  passing the user input to the services
await _authenticationService.signUpLogic(fullnameController.text,
    usernameController.text,
    emailController.text,
    passwordController.text);
print('user saved');
    }
else{
  print('Fill all info');
}



}


void navToLogin(){
  _navigationService.navigateTo(Routes.loginView);
}



}


