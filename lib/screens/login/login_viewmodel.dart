import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
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

  bool isPending = false;
  TextEditingController username= TextEditingController();
  TextEditingController password = TextEditingController();

  login()async {
    isPending = true;
    rebuildUi();
    //validation for empty entries
    if (username.text.isEmpty && password.text.isEmpty) {
      BotToast.showSimpleNotification(
        title: "Enter your details to Login",
        align: const Alignment(0, -0.8),
        duration: const Duration(seconds: 4),
      );
      isPending = false;
      rebuildUi();
    }

    else {
      String result = await _authenticationService.login(
          username.text, password.text);
      //wrong user name
      if (result == 'User does not exist') {
        BotToast.showSimpleNotification(
          title: result,
          align: const Alignment(0, -0.8),
          duration: const Duration(seconds: 4),
        );
        isPending = false;
        rebuildUi();
      }
      //wrong password
      else if (result == 'Wrong password') {
        BotToast.showSimpleNotification(
          title: result,
          align: const Alignment(0, -0.8),
          duration: const Duration(seconds: 4),
        );
        isPending = false;
        rebuildUi();
      }
      //ready to login
      else{
        BotToast.showSimpleNotification(
          title: result,
          align: const Alignment(0, -0.8),
          duration: const Duration(seconds: 4),
        );
        username.clear();
        password.clear();
        rebuildUi();
        await _navigationService.clearStackAndShow(Routes.mainView);
      }
    }
  }

  void navToSignUp(){
    _navigationService.navigateTo(Routes.signUpView);
  }




// clear() async{
//   var box = await Hive.openBox('userDatabase');
//   // box.clear();
//   print('db is cleared');
// }
}