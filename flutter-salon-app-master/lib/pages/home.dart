import 'package:flutter/material.dart';
import 'package:salon_app/uidata.dart';
import 'package:salon_app/widgets/image_card.dart';
import 'package:salon_app/widgets/my_column.dart';
import 'package:salon_app/widgets/specialist_column.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenSizeWidth  = MediaQuery.of(context).size.width;
    final screenSizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.short_text, color: Colors.black87),
            onPressed: () {}),
        actions: <Widget>[
          Container(
            decoration: BoxDecoration(),
            margin: EdgeInsets.only(right: 15, top: 15),
            child: CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(
                "images/profile.jpg",
              ),
            ),
          ),
        ],
      ),
      
      body: Container(
        width: screenSizeWidth,
        height: screenSizeHeight,
        padding: EdgeInsets.only(top:16, left:16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  height: screenSizeHeight * .2,
                  width: screenSizeWidth,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      ImageCard(cardImg: "images/braid4.jpg"),
                      SizedBox(width: 10),
                      ImageCard(cardImg: "images/braid3.jpg"),
                      SizedBox(width: 10),
                      ImageCard(cardImg: "images/braid4.jpg"),
                      SizedBox(width: 10),
                      ImageCard(cardImg: "images/braid3.jpg"),
                    ],
                  )),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(context, UIData.bookPageRoute),
                      child: MyColumn(
                        columnImg: "images/braid.png",
                        columnTxt: "Tranças",
                        columnBg: UIData.lightColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, UIData.bookPageRoute),
                      child: MyColumn(
                        columnImg: "images/abuja.png",
                        columnTxt: "Abuja",
                        columnBg: UIData.lighterColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(context, UIData.bookPageRoute),
                      child: MyColumn(
                        columnImg: "images/blow.png",
                        columnTxt: "Secador",
                        columnBg: UIData.lighterColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, UIData.bookPageRoute),
                      child: MyColumn(
                        columnImg: "images/haircut.png",
                        columnTxt: "Cabelo",
                        columnBg: UIData.lighterColor,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, UIData.bookPageRoute),
                      child: MyColumn(
                        columnImg: "images/relaxer.png",
                        columnTxt: "Relaxer",
                        columnBg: UIData.lighterColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, UIData.bookPageRoute),
                      child: MyColumn(
                        columnImg: "images/shampoo.png",
                        columnTxt: "Shampoo",
                        columnBg: UIData.lighterColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, UIData.bookPageRoute),
                      child: MyColumn(
                        columnImg: "images/nail.png",
                        columnTxt: "Manicure",
                        columnBg: UIData.lighterColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, UIData.bookPageRoute),
                      child: MyColumn(
                        columnImg: "images/more.png",
                        columnTxt: "More",
                        columnBg: UIData.lighterColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Text("Corte de Cabelo",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
                    TextButton(
                        onPressed: () {},
                        child: Text("Mostrar Tudo",
                            style: TextStyle(color: Colors.black54)))
                  ]),
              SizedBox(height: 6),
              Container(
                  height: 230,
                  width: screenSizeWidth,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SpecialistColumn(
                          specImg: "images/braid2.jpg", specName: "Anny Roy"),
                      SizedBox(width: 12),
                      SpecialistColumn(
                          specImg: "images/profile.jpg", specName: "Joy Roy"),
                      SizedBox(width: 12),
                      SpecialistColumn(
                          specImg: "images/braid3.jpg",
                          specName: "Patience Roy"),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
