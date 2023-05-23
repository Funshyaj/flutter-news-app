import 'package:bot_toast/bot_toast.dart';
import 'package:demo_app/services/signup_services.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class SignUpViewModel extends BaseViewModel {

  //set up for navigation
  final _navigationService = locator<NavigationService>();

//  set up for signup service
  final _signUpService = locator<SignUpService>();

//creating a controllers
  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

//create form key
  final formKey = GlobalKey<FormState>();

  //set isPending state
  bool isPending = false;


  signUp() async{
    isPending = true;
    notifyListeners();
//  passing the user input to the services
   bool result = await _signUpService.signUpLogic(
          fullNameController.text,
          usernameController.text.toLowerCase(),
          emailController.text,
          passwordController.text);

   if(result){
    BotToast.showSimpleNotification(
      title: "Account successfully created",
      align: const Alignment(0, -0.8),
      duration: const Duration(seconds: 4),
    );
   isPending = false;
    notifyListeners();
    //set user first time to false
    //  when user signs up its not their first time anymore
    await _signUpService.setNonFirstTime();
    await _navigationService.clearStackAndShow(Routes.mainView);
   }
   else if(!result){
     BotToast.showSimpleNotification(
       title: "Something went wrong, try again",
       align: const Alignment(0, -0.8),
       duration: const Duration(seconds: 4),
     );
     isPending = false;
     notifyListeners();
   }
  }


navToLogin() async {
  await _navigationService.navigateTo(Routes.loginView);
}



}


