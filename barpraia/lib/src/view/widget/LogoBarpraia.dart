import 'package:flutter/material.dart';

class LogoBarpraia extends StatefulWidget {

  @override
  _LogoBarpraiaState createState() => _LogoBarpraiaState();
}

class _LogoBarpraiaState extends State<LogoBarpraia> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/images/barpraia-logo.jpg', width: 350,height: 200,),
    );
  }
}
