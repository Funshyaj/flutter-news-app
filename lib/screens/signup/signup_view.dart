import 'package:demo_app/screens/signup/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'email')
])

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        // onViewModelReady: (model) => go(),
        viewModelBuilder: ()=> SignUpViewModel(),
        builder: (context, model, child)=>Scaffold(
          body: Center(child: Text('sdsd')),
        ));
  }
}
