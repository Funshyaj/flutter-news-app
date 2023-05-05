import 'package:demo_app/screens/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      onViewModelReady: (model)=> model.firstTimeLogic(),
      fireOnViewModelReadyOnce: true,
      builder:(context,model,child)=> const Scaffold(
        body: Center(
          child: Text('Welcome'),
        ),
      ),
      viewModelBuilder:()=> StartUpViewModel()

    );
  }
}
