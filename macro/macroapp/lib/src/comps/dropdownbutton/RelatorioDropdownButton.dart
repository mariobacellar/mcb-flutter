import 'package:flutter/material.dart';

class RelatorioDropdownButton extends StatefulWidget{

  //   RelatorioDropdownButton({Key? key}) : super(key: key);
  
  @override
  _RelatorioDropdownButtonState createState() => _RelatorioDropdownButtonState();
}

class _RelatorioDropdownButtonState extends State<RelatorioDropdownButton> {
    
    String _dropdownValue="Salesforce";

 @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _dropdownValue,
      dropdownColor: Colors.green[200],
      icon: RotatedBox(
        quarterTurns: 1,
        child: Icon(Icons.chevron_right, color: Colors.black)
      ),
      iconSize: 34,
      elevation: 16,
      isExpanded: false,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.deepOrange[400],
      ),
      hint: Text("Selecione o relatorio", 
        style: TextStyle(color: Colors.deepOrange[600]),
      ),
      items: <String>["Salesforce", "CRM", "Canal"].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      onChanged: (String? newValue)   {
        setState(() {
          _dropdownValue = newValue!;
        });
      },
      );
  }
}
