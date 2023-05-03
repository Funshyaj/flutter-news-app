import 'package:demo_app/screens/login/login_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class LoginView extends StackedView<LoginViewModel>{
const LoginView({super.key});

  @override
  Widget builder(
      BuildContext context,
      LoginViewModel viewModel,
      Widget? child)=> Scaffold(
backgroundColor: Colors.red,
    body: Center(
      child: Text(viewModel.title),
    ),
  );

  @override
  LoginViewModel viewModelBuilder (BuildContext context)=> LoginViewModel();
}

