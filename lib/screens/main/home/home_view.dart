import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive
      (viewModelBuilder: () => HomeViewModel(),
        onViewModelReady: (model) => model.fetch(),
        fireOnViewModelReadyOnce: true,
        builder: (context, model, child) =>
         const Scaffold(
            body:
            //recommended for you text
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Tech news recommended for you',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                ),),
            ),

          ),
        );
  }
}