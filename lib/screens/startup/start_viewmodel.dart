import 'package:demo_app/app/app.locator.dart';
import 'package:demo_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../services/auth_service.dart';

class StartUpViewModel extends BaseViewModel {
  final String title = 'News from around the world for you';
 final String subtitle = 'Best time to read, take your time to read a little more of this world';
 String btnName = 'Get started';

  // 1. Get the Authentication and NavigationService
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();

  runStartupLogic()  {
    // 2. Check if the database is empty
    if (!_authenticationService.userLoggedIn()) {
      _navigationService.navigateTo(Routes.loginView);
    }
    // 3. Navigate to Sign up view
    else {
      _navigationService.navigateTo(Routes.signUpView);
    }
  }

}