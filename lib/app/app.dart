import 'package:demo_app/services/api_servies.dart';
import 'package:demo_app/services/auth_services.dart';
import 'package:demo_app/services/fetch_post_services.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:demo_app/screens/welcome/welcome_view.dart';
import 'package:stacked_services/stacked_services.dart';
import '../screens/login/login_view.dart';
import '../screens/main/main_view.dart';
import '../screens/signup/signup_view.dart';
import '../screens/startup/startup_view.dart';
import '../services/signup_services.dart';
import '../services/startup_services.dart';

//this is where you register routes
@StackedApp(routes: [
  MaterialRoute(page: StartUpView, initial: true),
  MaterialRoute(page: WelcomeView),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: SignUpView),
  MaterialRoute(page: MainView),
],

  //this is where you register any new services
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthenticationServiceImpl, asType: AuthenticationService),
    LazySingleton(classType: SignUpServiceImpl, asType: SignUpService),
    LazySingleton(classType: StartUpServiceImpl, asType: StartUpService),
    LazySingleton(classType: FetchPostServiceImpl, asType: FetchPostService),
    LazySingleton(classType: ApiServiceImpl ,asType: ApiService),
  ]
)
class AppSetup {}