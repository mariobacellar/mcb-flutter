import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class Idioma {
  const Idioma(this.name);

  final String name;
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Idioma> idiomas = <Idioma>[
    Idioma('Portugues (Brasil)'),
    Idioma('Inglês')
  ];
  Idioma selectedIdioma;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIdioma = idiomas[0];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: DropdownButton<Idioma>(
                  underline: null,
                  value: selectedIdioma,
                  icon: Icon(Icons.keyboard_arrow_down),
                  onChanged: (Idioma newValue) {
                    setState(() {
                      selectedIdioma = newValue;
                    });
                  },
                  items: idiomas.map((Idioma idioma) {
                    return new DropdownMenuItem<Idioma>(
                      value: idioma,
                      child: new Text(
                        idioma.name,
                        style: new TextStyle(color: Colors.grey),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/name.png',
                      height: 70,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Colors.grey[300]),
                            color: Colors.grey[100]),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Big Shoulders Display",
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    'Número de telefone, email ou nome de usuário'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
                        
                        height: 50,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Colors.grey[300]),
                            color: Colors.grey[100]),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            obscureText: true,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Big Shoulders Display",
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Senha',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          color: Colors.blue[100],
                          child: Text(
                            "Entrar",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Esqueceu seus dados de login?',
                                style: TextStyle(fontSize: 12),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  " Obtenha ajuda para entrar",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "assets/face.png",
                              height: 20,
                              width: 20,
                            ),
                            Text(
                              " Entrar como @everton_figueiredo",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: Divider(
                                color: Colors.black,
                                height: 36,
                              ),
                            ),
                          ),
                          Text("OU"),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 10.0),
                              child: Divider(
                                color: Colors.black,
                                height: 36,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Não tem uma Conta?',
                            style: TextStyle(fontSize: 15),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              " Cadastre-se",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.1, color: Colors.grey),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Center(
                    child: Text(
                      'Instagram do Facebook',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
