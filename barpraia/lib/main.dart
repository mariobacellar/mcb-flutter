 
import 'package:flutter/material.dart';
import 'src/view/pages/home/HomePage.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {

  var _versao = '1.0_Beta';

  static const _primaryColor = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.light(),
        themeMode: ThemeMode.light,
        title: 'Barpraia',
        theme: myTheme(),
        home : HomePage(title: 'Barpraia $_versao'),
    );
  }

  ThemeData myTheme() => ThemeData( primarySwatch:  _primaryColor,);


}

