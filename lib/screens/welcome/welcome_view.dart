import 'package:News_Daily/screens/welcome/welcome_viewmodel.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';


class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context) {
  return ResponsiveBuilder(
      builder: (context, sizingInformation) {

        //for pc view and mobile
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {

          return ViewModelBuilder<WelcomeViewModel>.reactive(
              viewModelBuilder: () => WelcomeViewModel(),
              builder: (context, model, child) =>
                  Scaffold(
                      backgroundColor: Colors.white,
                      body: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 10, right: 10, bottom: 10),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    20)),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/welcome.jpg"),
                                    fit: BoxFit.cover),
                              ),

                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 20, left: 20, right: 20),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('News from around the world for you',
                                    textAlign: TextAlign.center,
                                    style:
                                    TextStyle(
                                      fontSize: 32.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                      color: Colors.black,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Best time to read, take your time to read a little more of this world',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.none,
                                        fontSize: 18
                                    ),),
                                  const SizedBox(height: 15),
                                  FloatingActionButton.extended(onPressed: () {
                                    model.navToSignUp();
                                  },
                                    backgroundColor: Colors.indigo[800],
                                    label: const Text('Get started',
                                      style: TextStyle(fontSize: 18,
                                          fontWeight: FontWeight.bold),),
                                    extendedPadding: const EdgeInsets.symmetric(
                                        vertical: 30, horizontal: 70),
                                  ),
                                  const SizedBox(height: 15),
                                ]
                            ),
                          )
                        ],
                      )
                  )
          );
        }


        // for mobile view
        return ViewModelBuilder<WelcomeViewModel>.reactive(
            viewModelBuilder: () => WelcomeViewModel(),
            builder: (context, model, child) =>
                Scaffold(
                    backgroundColor: Colors.white,
                    body: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 20, left: 10, right: 10, bottom: 10),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  20)),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/welcome.jpg"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 20, left: 10, right: 10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('News from around the world for you',
                                  textAlign: TextAlign.center,
                                  style:
                                  TextStyle(
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 2,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Best time to read, take your time to read a little more of this world',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.none,
                                      fontSize: 18
                                  ),),
                                const SizedBox(height: 15),
                                FloatingActionButton.extended(onPressed: () {
                                  model.navToSignUp();
                                },
                                  backgroundColor: Colors.indigo[800],
                                  label: const Text('Get started',
                                    style: TextStyle(fontSize: 18,
                                        fontWeight: FontWeight.bold),),
                                  extendedPadding: const EdgeInsets.symmetric(
                                      vertical: 30, horizontal: 70),
                                ),
                                const SizedBox(height: 15),
                              ]
                          ),
                        )
                      ],
                    )
                )
        );
      }
  );
}
}

