import 'package:stacked/stacked.dart';
import 'package:demo_app/screens/startup/start_viewmodel.dart';
import 'package:flutter/material.dart';


class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context) {
  return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: ()=> StartUpViewModel(),
  // onViewModelReady: (model)=>  model.firstTimeLogic(),
  builder: (context, model, child)=>
  Scaffold(
backgroundColor: Colors.white,
body: Column(
children: <Widget> [
Expanded(
child: Container(
// decoration: BoxDecoration(color: Colors.red),
// padding: const EdgeInsets.only(top: 20),
margin: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
width: double.infinity,
decoration: const BoxDecoration(
borderRadius: BorderRadius.all(Radius.circular(20)),
image: DecorationImage(
image: AssetImage("assets/images/welcome.jpg"),
fit: BoxFit.cover),
),
// Image(
//   image: const AssetImage('assets/images/welcome.jpg'),height:size.height,width:size.height,
// ),
),
),
Container(
padding: const EdgeInsets.only(top: 5, bottom: 20, left: 10,right: 10),
child: Column(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
const Text('News from around the world for you',
textAlign: TextAlign.center,
style:
TextStyle(
fontSize: 32.0,
fontWeight: FontWeight.bold,
letterSpacing: 2,
color: Colors.black,
decoration: TextDecoration.none,
),
),
const SizedBox(height: 10),
const Text('Best time to read, take your time to read a little more of this world',
textAlign: TextAlign.center,
style: TextStyle(
color: Colors.grey,
decoration: TextDecoration.none,
fontSize: 18
),),
const SizedBox(height: 15),
FloatingActionButton.extended(onPressed: (){
model.navToSignUp();
},
backgroundColor: Colors.indigo[800],
label:  const Text('Get started',
style: TextStyle(fontSize: 18,
fontWeight: FontWeight.bold),),
extendedPadding: const EdgeInsets.symmetric(vertical: 30,horizontal: 70),
),
const SizedBox(height: 15),
]
),
)
],
)
)
  );


}
}

