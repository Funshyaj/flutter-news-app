import 'package:News_Daily/screens/main/explore/explore_view.dart';
import 'package:News_Daily/screens/main/home/home_view.dart';
import 'package:News_Daily/screens/main/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'main_viewmodel.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive
      (viewModelBuilder: () => MainViewModel(),
      fireOnViewModelReadyOnce: true,
      builder: (context, model, child) =>
          SafeArea(
            child: Scaffold(
              body: viewToDisplay(model.currentIndex),
              bottomNavigationBar:
              BottomNavigationBar(
                currentIndex: model.currentIndex,
                type: BottomNavigationBarType.fixed,
                onTap: model.setIndex,
                selectedFontSize: 15,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.explore),
                    label: 'explore',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'profile',
                  ),
                ],
                selectedItemColor: Colors.indigo[800],
                unselectedItemColor: Colors.grey,
                showUnselectedLabels: true,

              ),

            ),
          ),
    );
  }
}

Widget viewToDisplay (int index){
switch (index) {
  case 0:
    return const HomeView();
  case 1:
    return const ExploreView();
  case 2:
    return const  ProfileView();
    default:
      return const HomeView();
}
}

