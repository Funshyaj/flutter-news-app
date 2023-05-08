// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/api_servies.dart';
import '../services/auth_services.dart';
import '../services/fetch_post_services.dart';
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
  locator.registerLazySingleton<FetchPostService>(() => FetchPostServiceImpl());
  locator.registerLazySingleton<ApiService>(() => ApiServiceImpl());
}
