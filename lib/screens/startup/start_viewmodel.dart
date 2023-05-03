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

  Future runStartupLogic() async {
    // 2. Check if the user is logged in
    if (_authenticationService.userLoggedIn()) {
    //     // 3. Navigate to HomeView
    //     _navigationService.replaceWith(Routes.);
    //   } else {
        // 4. Or navigate to LoginView
      _navigationService.navigateTo(Routes.loginView);
    }
  }

}