import 'package:flutter/material.dart';

class Logo extends StatefulWidget {

  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/images/findsomeone.png', width: 350,height: 200,),
    );
  }
}
