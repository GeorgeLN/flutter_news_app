
//TabsScreen

import 'package:flutter/material.dart';
import 'package:news_app/src/screens/tab2_screen.dart';
import 'package:provider/provider.dart';

import 'package:news_app/src/screens/screens.dart';

class TabsScreen extends StatelessWidget {
   
  const TabsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _NavigationModel(),

      child: const Scaffold(
        body: _Pages(),
    
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      fixedColor: Colors.red,
      currentIndex: navigationModel.getCurrentIndex,

      onTap: (value) {
        navigationModel.setCurrentIndex = value;
      },

      items: const [
        BottomNavigationBarItem(
          icon: Icon( Icons.person_2_outlined ),
          label: 'Para ti',
        ),

        BottomNavigationBarItem(
          icon: Icon( Icons.public ),
          label: 'Encabezado',
        ),
      ], //items[]
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final navigationController = Provider.of<_NavigationModel>(context);
    //final newsServices = Provider.of<NewsService>(context);

    return PageView(
      controller: navigationController.getPageController,
      //physics: const BouncingScrollPhysics(), //Animación al tratar de ir a una página no existente.
      physics: const NeverScrollableScrollPhysics(), //Inhabilita el movimiento de los scrolls

      children: const [
        
        Tab1Screen(),

        Tab2Screen(),
      ], //Children[]
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _currentIndex = 0;

  final PageController _pageController = PageController(
    initialPage: 0,
  );

  int get getCurrentIndex => _currentIndex;

  set setCurrentIndex( int valor ) {

    _currentIndex = valor; //Para el index del BottomNavigation.

    _pageController.animateToPage( //Para el movimiento entre pages.
      valor,
      duration: const Duration( milliseconds: 250 ),
      curve:Curves.easeInOut,
    );

    notifyListeners();
  }

  PageController get getPageController => _pageController; //Se crea el Get.
}