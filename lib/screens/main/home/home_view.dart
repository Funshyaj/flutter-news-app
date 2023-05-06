import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive
      (viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) =>
          Scaffold(
             body:
             //recommended for you text
             SingleChildScrollView(
               child: Container(
                 margin: const EdgeInsets.only(top: 30),
                 padding: const EdgeInsets.all(10),
                 child: Column(
                   children: const [Padding(
                     padding: EdgeInsets.symmetric(vertical: 8.0),
                     child: Text('Tech news recommended for you',
                       style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 24,
                       ),),
                   ),
                   ]
                 ),
               ),
             ),

           ),
        );
  }
}