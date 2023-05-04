import 'package:demo_app/screens/signup/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'email')
])

class SignUpView extends StackedView<SignUpViewModel> {
  const SignUpView({super.key});

  @override
  Widget builder(BuildContext context, SignUpViewModel viewModel,
      Widget? child) =>

      Scaffold(
          body: SingleChildScrollView(
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
                     viewModel.NavToLogin();                     // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const Login()),
                        // );

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
                          const SizedBox(height: 30,),
                          Text('Full Name',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600]
                              )
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(
                            decoration: const InputDecoration(
                              // prefixIcon: const Icon(Icons.person_2_outlined)
                              hintText: 'Enter your full name',
                            ),
                          ),
                          const SizedBox(height: 30,),
                          Text('Username',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600]
                              )
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(
                            decoration: const InputDecoration(
                              // prefixIcon: const Icon(Icons.person_2_outlined)
                              hintText: 'Unique Username',
                            ),
                          ),
                          const SizedBox(height: 30,),
                          Text('Email',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600]
                              )
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(
                            decoration: const InputDecoration(
                              // prefixIcon: const Icon(Icons.person_2_outlined)
                              hintText: 'Email',
                            ),
                          ),
                          const SizedBox(height: 30,),
                          Text('Set a Password',style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600]
                          )),
                          const SizedBox(height: 10,),
                          TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              // prefixIcon: Icon(Icons.password_outlined),
                              hintText: 'Password',
                            ),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: (){

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
          )
      );

  @override
  SignUpViewModel viewModelBuilder(BuildContext context) => SignUpViewModel();



}