import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'explore_viewmodel.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExploreViewModel>.reactive
      (viewModelBuilder: () => ExploreViewModel(),
      builder: (context, model, child) =>
      Scaffold(
        body:
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Tech news',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Sport news',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),),
                    ),




                  ],
                ),
              ),
            )
        //recommended for you text


      ),
    );
  }
}