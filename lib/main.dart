import 'package:bot_toast/bot_toast.dart';
import 'package:News_Daily/app/app.locator.dart';
import 'package:News_Daily/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked_services/stacked_services.dart';
import 'models/user.dart';
import 'package:google_fonts/google_fonts.dart';


void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  //for other
  await Hive.openBox('otherData');
  //for users
  await Hive.openBox<UserModel>('userdatabase');
  setupLocator();

  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(desktop: 800, tablet: 550, watch: 200),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      //to deactivate thr debug banner
      debugShowCheckedModeBanner: false,
      //tittle of the page, probably not necessary
      title: 'Flutter Demo',
      //theme of the app
      theme: ThemeData(
          //setting global theme for widgets in the app
          primarySwatch: Colors.indigo,
          textTheme: GoogleFonts.nunitoTextTheme(textTheme),
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
              letterSpacing: 1,),
              backgroundColor: Colors.indigo[800],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                )
            )
          ) ),

      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
     //dependencies for routes
     navigatorKey: StackedService.navigatorKey,
      onGenerateRoute:StackedRouter().onGenerateRoute,
      //start up screen
    );
  }
}
