import 'package:flutter/material.dart';
import 'package:macroapp/src/pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Macro Team',
      theme: ThemeData( 
        primaryColor: Colors.teal,
      ),
      
      home: HomePage(title: 'Macro Team'),
    );

  }
}




