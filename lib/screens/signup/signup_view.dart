import 'package:demo_app/screens/signup/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../custom components/input.dart';


class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        // onViewModelReady: (model) => go(),
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
                            fontFamily: 'NunitoRegular',
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                      const SizedBox(width: 5,),
                      TextButton(onPressed: (){


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
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         const SizedBox(height: 30),
                          Input(
                            label:'Full name',
                          placeholderTxt: 'Enter your full name',
                          controller: model.fullnameController,),

                          Input(
                            label:'Username',
                            placeholderTxt: 'Enter a unique username',
                            controller: model.usernameController,),

                          Input(
                            label:'Email',
                            placeholderTxt: 'Enter your email',
                            controller: model.emailController,),

                          Input(
                            label:'Password',
                            placeholderTxt: 'Set a password',
                            controller: model.passwordController,),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: (){
                              model.signUp();
                              },
                              child: const Text('Sign up'),
                            ),
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
