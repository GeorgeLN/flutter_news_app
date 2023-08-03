//.................................
// ███╗   ███╗ █████╗ ██╗███╗   ██╗
// ████╗ ████║██╔══██╗██║████╗  ██║
// ██╔████╔██║███████║██║██╔██╗ ██║
// ██║╚██╔╝██║██╔══██║██║██║╚██╗██║
// ██║ ╚═╝ ██║██║  ██║██║██║ ╚████║
// ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝
//.................................

import 'package:flutter/material.dart';
import 'package:news_app/src/screens/screens.dart';
import 'package:news_app/src/services/news_services.dart';
import 'package:news_app/src/themes/dark_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ //Crear multiples instancias.
        ChangeNotifierProvider( create: (context) => NewsService() ),
      ], //Providers[]

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: darkTheme,
        home: const TabsScreen(),
        
      ),
    );
  }
}