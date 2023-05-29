import 'package:News_Daily/screens/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
          onViewModelReady: (model) => model.firstTimeLogic(),
          fireOnViewModelReadyOnce: true,
          builder: (context, model, child) =>
              Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.description, color: Colors.indigo[800],
                          size: 80,),
                        const Text('News Daily',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold
                          ),),
                      ]
                  ),
                ),
              ),
          viewModelBuilder: () => StartUpViewModel()

      );
  }
}
