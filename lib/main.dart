import 'package:demo_app/app/app.locator.dart';
import 'package:demo_app/app/app.router.dart';
import 'package:demo_app/screens/login/login_view.dart';
import 'package:demo_app/screens/startup/start_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';



void main() async {
  await Hive.initFlutter();
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //to deactivate thr debug banner
      debugShowCheckedModeBanner: false,
      //tittle of the page, probably not necessary
      title: 'Flutter Demo',
      //theme of the app
      theme: ThemeData(
          //setting global theme for widgets in the app
        fontFamily: 'Nunito',
          primarySwatch: Colors.indigo,
        inputDecorationTheme:  InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 3, color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: const BorderSide(
                width: 3, color: Colors.indigo),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
          elevatedButtonTheme:ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              textStyle: const TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontFamily: 'NunitoBold'),
              backgroundColor: Colors.indigo[800],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                )
            )
          ) ),

      //start up route
      initialRoute: Routes.startUpView,

     //dependencies for routes
     navigatorKey: StackedService.navigatorKey,
      onGenerateRoute:StackedRouter().onGenerateRoute,
      //start up screen
    );
  }
}
