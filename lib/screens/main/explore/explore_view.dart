import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'explore_viewmodel.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExploreViewModel>.reactive
      (viewModelBuilder: () => ExploreViewModel(),
      // onViewModelReady: (model) => model.fetch(),
      // fireOnViewModelReadyOnce: true,
      builder: (context, model, child) =>
      Scaffold(
        body:
            Column(
              children: [
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
            )
        //recommended for you text


      ),
    );
  }
}