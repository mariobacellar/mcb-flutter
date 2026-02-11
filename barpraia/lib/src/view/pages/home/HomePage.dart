import 'dart:async';

import 'package:barpraia/src/control/services/UserService.dart';
import 'package:barpraia/src/view/widget/LogoBarpraia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();


}


class _HomePageState extends State<HomePage> {

  int _counter = 0;

  UserService _service =  UserService('https://jsonplaceholder.typicode.com/todos/');

  var spinkit = SpinKitSpinningLines( color: Colors.white, size: 50.0, );

  String  viewhttpJSON="";

  void _incrementCounter()  {
    
    setState( () {
      spinkit = SpinKitSpinningLines( color: Colors.blue, size: 50.0, );
      viewhttpJSON ="";
    });

    _counter++;

    if  (_counter==200) 
      _counter=1;

    
    Future<dynamic> obj = _service.getOne(_counter);
    
    // List<User> ltusers=[];
    // UserService us = UserService('https://jsonplaceholder.typicode.com/todos/');
    // Future<dynamic> objlt = us.getAll();
    // objlt.then( (value) => ltusers = value);
    // for(var item in ltusers )  
    // print("**********user=>$item");

    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        obj.then( (value) => viewhttpJSON = value.toString() ); 
        spinkit = SpinKitSpinningLines( color: Colors.white, size: 50.0, );
        });
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      //  backgroundColor: Color(0xff612F74),
      ),
      body: myBody(context),
      
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, 
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  SingleChildScrollView myBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 10,),
          LogoBarpraia(),
          SizedBox(height: 10,),
          Text('Você solicitou o usuário:', ),
          Text( '$_counter', style: Theme.of(context).textTheme.headline4, ),
          SizedBox(height: 10,),
          Text(viewhttpJSON),
          SizedBox(height: 30,),
          spinkit,
          TextButton( 
            child: Text('Dark Mode', style: TextStyle(color: Colors.black) ), 
            onPressed: () {
              print('Pressed');
            }
          )
          ],
      ),
    );
  }
}
