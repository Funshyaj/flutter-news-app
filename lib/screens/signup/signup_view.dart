import 'package:bot_toast/bot_toast.dart';
import 'package:demo_app/screens/signup/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../custom components/input.dart';


class SignUpView extends StatelessWidget {
   const SignUpView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        viewModelBuilder: ()=> SignUpViewModel(),
        onViewModelReady: (model)=> model.cancel(),
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
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),),
                  const SizedBox(height: 5,),

                  Row(
                    children: [
                      const Text('Already Have an account ?',
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
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color:Colors.indigo[800] ),))

                    ],
                  ),

                  Form(
                    key: model.formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         const SizedBox(height: 30),
                          Input(
                            isPasswordField: false,
                            label:'Full name',
                          placeholderTxt: 'Enter your full name',
                          controller: model.fullNameController,),

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
                                // if fields are not empty
                                if ((model.fullNameController.text != '') &&
                                        (model.usernameController.text != '') &&
                                        (model.emailController.text != '') &&
                                        (model.passwordController.text != '')) {

                                  //run sign up
                                      model.signUp();

                                      //display a processing snack bar
                                      BotToast.showLoading(
                                        duration: const Duration(seconds: 4)
                                      );


                                // ScaffoldMessenger.of(context).showSnackBar(
                                //         const SnackBar(
                                //             content: Text(
                                //                 'Creating Account, hold on')),
                                //       );
                                    }

                                else{
                                  BotToast.showSimpleNotification(
                                    title: "Kindly fill all the fields correctly",
                                    subTitle: 'now!!!',
                                    align: const Alignment(0, -0.8),
                                    duration: const Duration(seconds: 5),
                                  );
                                }
                                  },
                              child: const Text('Sign up'),
                            ),
                          ),

                          TextButton(
                              onPressed: ()=>
                              model.test(),

                                  // BotToast.showLoading(),
                          child: const Text('dfs'),
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
