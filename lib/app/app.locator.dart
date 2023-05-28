// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../screens/main/explore/explore_viewmodel.dart';
import '../screens/main/home/home_viewmodel.dart';
import '../services/api_services.dart';
import '../services/auth_services.dart';
import '../services/signup_services.dart';
import '../services/startup_services.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton<AuthenticationService>(
      () => AuthenticationServiceImpl());
  locator.registerLazySingleton<SignUpService>(() => SignUpServiceImpl());
  locator.registerLazySingleton<StartUpService>(() => StartUpServiceImpl());
  locator.registerLazySingleton<ApiService>(() => ApiServiceImpl());
  locator.registerSingleton<HomeViewModel>(HomeViewModel());
  locator.registerSingleton<ExploreViewModel>(ExploreViewModel());
}
