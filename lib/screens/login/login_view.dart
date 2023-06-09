import 'package:News_Daily/screens/login/login_viewmodel.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

import '../../custom components/input.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  @override
//    onViewModelReady(LoginViewModel viewModel) {
//   // if(viewModel.authMessage) {
//   //   BotToast.showSimpleNotification(title: "Wrong password");
//   // }
// }

  @override
  Widget builder(
          BuildContext context, LoginViewModel viewModel, Widget? child) =>
      ResponsiveBuilder(
        builder: (context, sizingInformation) {
          double width = MediaQuery.of(context).size.width;

          return Scaffold(
              body: SingleChildScrollView(
                  child: Center(
            child: Container(
                margin: const EdgeInsets.only(top: 60),
                padding: const EdgeInsets.all(30),
                width: getValueForScreenType<double>(
                  context: context,
                  mobile: width,
                  tablet: width * 0.6,
                  desktop: width * 0.4,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                                fontSize: getValueForScreenType<double>(
                                  context: context,
                                  mobile: 16,
                                  tablet: 18,
                                  desktop: 20,
                                ),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          TextButton(
                              onPressed: () {
                                viewModel.navToSignUp();
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    fontSize: getValueForScreenType<double>(
                                      context: context,
                                      mobile: 16,
                                      tablet: 18,
                                      desktop: 20,
                                    ),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo[800]),
                              ))
                        ],
                      ),
                      Form(
                          // key: _formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            const SizedBox(height: 30),
                            Input(
                              isPasswordField: false,
                              label: 'Username',
                              placeholderTxt: 'Enter your username',
                              controller: viewModel.username,
                            ),

                            Input(
                                isPasswordField: true,
                                label: 'Password',
                                placeholderTxt: 'Enter your password',
                                controller: viewModel.password),

                            //Submit button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            vertical: viewModel.isPending ? 14 : 20))),
                                onPressed: () {
                                  viewModel.login();
                                },
                                child: viewModel.isPending
                                    ? const CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation(Colors.white),
                                )
                                    : const Text('Login'),
                              ),
                            ),
                          ]))
                    ])),
          )));
        },
      );

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
