import 'package:demo_app/services/auth_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:demo_app/screens/startup/start_view.dart';
import 'package:stacked_services/stacked_services.dart';
import '../screens/login/login_view.dart';
import '../screens/signup/signup_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: StartUpView),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: SignUpView),
],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthenticationServiceImpl, asType: AuthenticationService),
  ]
)
class AppSetup {}