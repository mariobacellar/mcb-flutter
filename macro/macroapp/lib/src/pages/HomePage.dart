/*
Disable sound null safety using the --no-sound-null-safety flag to the dart or flutter command:
 $ dart --no-sound-null-safety run
 $ flutter run --no-sound-null-safety
Fonte: https://dart.dev/null-safety/unsound-null-safety
*/

import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:macroapp/src/comps/dropdownbutton/ClienteDropdownButton.dart';
import 'package:macroapp/src/comps/dropdownbutton/RelatorioDropdownButton.dart';
import 'package:macroapp/src/comps/Logo.dart';
import 'package:macroapp/src/models/User.dart';
import 'package:macroapp/src/service/UserService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  String _initialValue = "<digite o ID do usuário>";

  var tskCtrl = TextEditingController();

  SharedPreferences? preferences;

  @override
  void initState() {
    super.initState();
    getHttp();
    initializePreference().whenComplete(() {
      _counter = (preferences!.getInt('counter') ??
          0); // pega o ultimo valor salvo, mesmo se desligar o app
      setState(() {});
    });
  }

  Future<void> initializePreference() async {
    this.preferences = await SharedPreferences.getInstance();
    this.preferences?.setString("name", "Peter");
    this.preferences?.setStringList("infoList", ["developer", "mobile dev"]);
  }

  get key => null;

  void _incrementCounter() {

    setState(() {

      _counter++;
      this.preferences?.setInt("counter", _counter);
      viewhttpJSON = httpJSON.toString();

      print('Gravando contador[$_counter]');
      print('Armazenado .... ${this.preferences?.getInt("counter") ?? 0}');
      print(httpJSON);

print("********* service.userRequest() INIT");
service.userRequest(); 
print("********* service.userRequest() END");

    });
  }

  var viewhttpJSON = "";
  var httpJSON;
  var useTitle;
   
  UserService service = new UserService(host: 'https://jsonplaceholder.typicode.com',uri: '/todos' );

  void getHttp() async {
    try {

//*******************************************
print("********* service.userRequest() INIT");
service.userRequest(); 
print("********* service.userRequest() END");

//*******************************************

      var dio = Dio();
      dio.options.responseType = ResponseType.plain;

      Response response = await dio.get('https://jsonplaceholder.typicode.com/todos/1');

      httpJSON = response.data;
      print("********* $httpJSON");

      Map<String, dynamic> userMap = jsonDecode(httpJSON.toString());

      var user = User.fromJson(userMap);
      useTitle = user.title;

      print("Howdy ***  ");
      print(useTitle!);
      print(httpJSON);
    } catch (e) {
      print(e);
      print("######## DEU ERRO 2#######");
    }
  }

  @override
  Widget build(BuildContext context) {
    //tskCtrl.value='dddddd' as TextEditingValue;

    return Scaffold(
      //backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(widget.title),
        actions: [
          Icon(Icons.access_time),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.accessibility),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.arrow_circle_down),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.assessment),
          SizedBox(
            width: 10,
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Logo(),
            TextFormField(
              //controller: tskCtrl,
              keyboardType: TextInputType.text,
              initialValue: _initialValue,
              decoration: InputDecoration(
                //border: InputBorder.none,
                labelStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 40,
                    color: Colors.black,
                    fontFamily: "Big Shoulders Display"),
                labelText: 'Digite o ID do usuário:',
                filled: true,
              ),

              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
              onTap: () {
                setState(() {
                  tskCtrl.clear();
                  print("*************************");
                });
              },
            ),
            ClienteDropdownButton(
              key: key,
              callback: (ClienteModel) {},
            ),
            Text("Relatório de Fraude"),
            RelatorioDropdownButton(),
            Text("Relatório de Atendimento"),
            TextButton(
                child: Text('Solicite Relatório'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  shadowColor: Colors.red,
                  elevation: 5,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                onPressed: () {
                  setState(() {
                    _counter++;
                  });
                },
                onLongPress: () {
                  print('Long press');
                }),
            SizedBox(
              height: 50,
            ),
            Text(
              'Solicitações:[$_counter]',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 10,
            ),
            Text(viewhttpJSON),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        autofocus: true,
      ),
    );
  }
}
