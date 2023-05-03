import 'package:demo_app/demo_screens/scrap/home.dart';
import 'package:demo_app/demo_screens/scrap/signUp.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  late Box users;
  //initializing a form key
  final _formKey = GlobalKey<FormState>();

  //email  input controller
  final email = TextEditingController();
  //password input controller
  final password = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
   email.dispose();
   password.dispose();
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
    createBox();
  }

  void createBox ()async{
  final users = await Hive.openBox('userDatabase');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          fontFamily: 'NunitoRegular',
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),),
            const SizedBox(height: 5,),

            Row(
              children: [
               const Text("Don't have an account?",
                style: TextStyle(
                  fontFamily: 'NunitoRegular',
                  fontSize: 18,
                  fontWeight: FontWeight.bold

                ),),
                const SizedBox(width: 5,),

                TextButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  );
                },
                    child: Text('Register',
                  style: TextStyle(
                      fontFamily: 'NunitoRegular',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color:Colors.indigo[800] ),))

              ],
            ),

            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40,),
                 Text('Email',
                 style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                   color: Colors.grey[600]
                 )
                 ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      // prefixIcon: const Icon(Icons.person_2_outlined)
                      hintText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text('Password',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600]
                  )),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },

                    // for onchange event if needed/
                    // onChanged: (text) {
                    //   print('First text field: $text');
                    // },

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
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid,
                             AlertDialog(
                              // Retrieve the text the that user has entered by using the
                              // TextEditingController.
                              content: Text('email is :${email.text} Password is :${password.text}'),
                            );
                             print('email is :${email.text} Password is :${password.text}');
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => const Home()),
                             );
                          }


                      },
                      child: const Text('Login'),
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
  }
}


