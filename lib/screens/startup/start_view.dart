import 'package:stacked/stacked.dart';
import 'package:demo_app/screens/startup/start_viewmodel.dart';
import 'package:flutter/material.dart';

class StartUpView extends StackedView<StartUpViewModel> {
  const StartUpView({super.key});
  // final Size size = MediaQuery.of(context).size;
  @override
  Widget builder(
      BuildContext context,
      StartUpViewModel viewModel,
      child,
      )=>

  Scaffold(
        body: Container(
      // width: size.width,
      // height: size.height,
      decoration: const BoxDecoration(
          color: Colors.white
      ),
      child: Column(
        children: <Widget> [
          Expanded(
            child: Container(
              // decoration: BoxDecoration(color: Colors.red),
              // padding: const EdgeInsets.only(top: 20),
              margin: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    image: AssetImage("assets/images/welcome.jpg"),
                    fit: BoxFit.cover),
              ),
              // Image(
              //   image: const AssetImage('assets/images/welcome.jpg'),height:size.height,width:size.height,
              // ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 20, left: 10,right: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(viewModel.title,
                    textAlign: TextAlign.center,
                    style:
                    const TextStyle(
                      fontSize: 32.0,
                      fontFamily: 'NunitoBold',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(viewModel.subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'NunitoRegular',
                        color: Colors.grey,
                        decoration: TextDecoration.none,
                        fontSize: 18
                    ),),
                  const SizedBox(height: 15),
                  FloatingActionButton.extended(onPressed: (){
                    viewModel.runStartupLogic();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const Login()),
                    // );
                  },
                    backgroundColor: Colors.indigo[800],
                    label:  Text(viewModel.btnName,
                      style: const TextStyle(fontSize: 18,
                          fontFamily: 'NunitoBold'),),
                    extendedPadding: const EdgeInsets.symmetric(vertical: 30,horizontal: 70),
                  ),
                  const SizedBox(height: 15),
                ]
            ),
          )
        ],
      ),
    )
      );
  @override
  StartUpViewModel  viewModelBuilder (context) => StartUpViewModel();
  }
