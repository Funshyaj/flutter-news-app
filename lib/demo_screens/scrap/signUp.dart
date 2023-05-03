import 'package:demo_app/demo_screens/scrap/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  int counter = 1;

  final dio = Dio();

  void getHttp() async {
    final response = await dio.get('https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=2b8f4f5e4195450c87a0ceeaf519d557');
    if (kDebugMode) {
       var article = response.data;
      print(article.status);
    }
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );

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
                              getHttp();
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
  }
}
