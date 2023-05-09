import 'package:bot_toast/bot_toast.dart';
import 'package:demo_app/services/signup_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
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


//set up for toasts

  var cancel = BotToast.showLoading();


  test() async {
    Box others = Hive.box('otherData');

    bool firstTime = await others.get('firstTime', defaultValue: true);
    print('Is it my first time => $firstTime');

    // Box users = Hive.box<UserModel>('userdatabase');
// print(users.containsKey('Funshy'));
  }


  signUp() {

//  passing the user input to the services
   bool result =  _signUpService.signUpLogic(
          fullNameController.text,
          usernameController.text.toLowerCase(),
          emailController.text,
          passwordController.text);


   if(result){
     //close loading modal
    cancel();
    _navigationService.clearStackAndShow(Routes.mainView);
     print('user has been saved successfully');
   }


  //set user first time to false
  //  when user signs up its not their first time anymore
  _signUpService.setNonFirstTime();


  }


void navToLogin(){
  _navigationService.navigateTo(Routes.loginView);
}



}


