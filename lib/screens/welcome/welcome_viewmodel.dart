import 'package:News_Daily/app/app.locator.dart';
import 'package:News_Daily/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WelcomeViewModel extends BaseViewModel {

  // Setup NavigationService
  final _navigationService = locator<NavigationService>();


  navToSignUp(){
    _navigationService.navigateTo(Routes.signUpView);
  }

}