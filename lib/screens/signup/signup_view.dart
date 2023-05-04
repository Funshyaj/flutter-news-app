import 'package:demo_app/screens/signup/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../custom components/input.dart';


class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);


  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        // onViewModelReady: (model)async => await model.test().then(),
        viewModelBuilder: ()=> SignUpViewModel(),
        builder: (context, model, child)=>Scaffold(
          body:       SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 60),
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  const Text('Sign up',
                    style: TextStyle(
                        fontFamily: 'NunitoRegular',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),),
                  const SizedBox(height: 5,),

                  Row(
                    children: [
                      const Text('Have an account already?',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                      const SizedBox(width: 5,),
                      TextButton(onPressed: (){
                        model.navToLogin();
                      },
                          child: Text('Login',
                            style: TextStyle(
                                fontFamily: 'NunitoRegular',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color:Colors.indigo[800] ),))

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
                            label:'Full name',
                          placeholderTxt: 'Enter your full name',
                          controller: model.fullnameController,),

                          Input(
                            isPasswordField: false,
                            label:'Username',
                            placeholderTxt: 'Enter a unique username',
                            controller: model.usernameController,),

                          Input(
                            isPasswordField: false,
                            label:'Email',
                            placeholderTxt: 'Enter your email',
                            controller: model.emailController,),

                          Input(
                          isPasswordField: true,
                            label:'Password',
                            placeholderTxt: 'Set a password',

                            controller: model.passwordController,),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: (){
                              model.signUp();
                              // if (_formKey.currentState!.validate()) {
                              //   // If the form is valid, display a snackbar. In the real world,
                              //   // you'd often call a server or save the information in a database.
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(content: Text('Processing Data')),
                              //   );
                              // }
                              },
                              child: const Text('Sign up'),
                            ),
                          ),

                          TextButton(
                              onPressed: ()=> model.test(),
                          child: Text('dfs'),
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ),
          ),

        ));
  }
}
