import 'package:demo_app/screens/login/login_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

import '../../custom components/input.dart';

class LoginView extends StackedView<LoginViewModel>{
const LoginView({super.key});

  @override
  Widget builder(
      BuildContext context,
      LoginViewModel viewModel,
      Widget? child)=> Scaffold(
body:
SingleChildScrollView(
child: Container(
margin: const EdgeInsets.only(top: 60),
padding: const EdgeInsets.all(30),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const SizedBox(height: 20,),
const Text('Login',
style: TextStyle(
fontSize: 28,
fontWeight: FontWeight.bold,
color: Colors.black
),),
const SizedBox(height: 5,),

Row(
children: [
const Text('Dont have an account?',
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold
),),
const SizedBox(width: 5,),

TextButton(
    onPressed: (){
viewModel.navToSignUp();
},
child: Text('Register',
style: TextStyle(
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
label:'Username',
placeholderTxt: 'Enter your username',
controller: viewModel.username,),

Input(
isPasswordField: true,
label:'Password',
placeholderTxt: 'Enter your password',
controller: viewModel.password),


SizedBox(
width: double.infinity,
child: ElevatedButton(
onPressed: (){
viewModel.login();
// if (_formKey.currentState!.validate()) {
//   // If the form is valid, display a snackbar. In the real world,
//   // you'd often call a server or save the information in a database.
//   ScaffoldMessenger.of(context).showSnackBar(
//     const SnackBar(content: Text('Processing Data')),
//   );
// }
},
child: const Text('Login'),
),
),

]
)
)
]
)
  )
)
  );


  @override
  LoginViewModel viewModelBuilder (BuildContext context)=> LoginViewModel();
}

