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


  String authMessage = '';
  TextEditingController username= TextEditingController();
  TextEditingController password = TextEditingController();

  login(BuildContext context)async{

    //validation for empty entries
    if(username.text == '' && password.text == ''){
      return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content:Text('Enter your details to login')
          )
      );
    }


    var result = await _authenticationService.login(username.text, password.text);
    //wrong user name
     if(result == 'user does not exist') {
       authMessage = result;
     rebuildUi();
     }
     //wrong password
     else if (result == 'wrong password'){
       authMessage = result;
       rebuildUi();
     }
     //ready to login
     else {
       authMessage = result;
       username.clear();
       password.clear();
       rebuildUi();
       _navigationService.clearStackAndShow(Routes.mainView);
     }

     }


  getLoginResult(context , viewModel) {
    if(viewModel.authMessage == 'user does not exist'){
      return ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content:Text(viewModel.authMessage)
          )
      );
    }

    else if (viewModel.authMessage == 'Wrong password'){
      return ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content:Text(viewModel.authMessage)
          )
      );
    }

    else if (viewModel.authMessage == 'Welcome'){
      return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:Text(viewModel.authMessage)
          )
      );
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