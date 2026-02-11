import 'package:flutter/material.dart';
import 'package:salon_app/uidata.dart';
import 'package:salon_app/widgets/button.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage( "images/main.webp", ),
                      fit: BoxFit.contain)),
              height: MediaQuery.of(context).size.height * .45,
            ),
            Text("Agende seu Atendimento \ncom seu Stylist Favorito",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    fontSize: 22,
                    letterSpacing: 1.3)),
            Text("Seu Stylist na Ponta dos Dedos",
              textAlign: TextAlign.center,
              style: TextStyle(height: 1.8, letterSpacing: 1.3),
            ),
            MyButton(btnText: "Vem com Agente",
            onpressed: () => Navigator.pushNamed(context, UIData.homePageRoute)),
          ],
        ),
      ),
    );
  }
}
