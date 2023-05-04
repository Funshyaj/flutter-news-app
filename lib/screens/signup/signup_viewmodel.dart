import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class SignUpViewModel extends BaseViewModel{

  //set up for navigation
  final _navigationService = locator<NavigationService>();

//creating a controllers
TextEditingController fullnameController = TextEditingController();
TextEditingController usernameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();


signUp(){
  print(emailController.text);
}


void navToLogin(){
  _navigationService.navigateTo(Routes.loginView);
}

}


