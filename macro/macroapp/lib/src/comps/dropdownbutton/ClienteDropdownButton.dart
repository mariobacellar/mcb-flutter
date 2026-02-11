import 'package:flutter/material.dart';
import 'package:macroapp/src/models/ClienteModel.dart';

class ClienteDropdownButton extends StatefulWidget {

  ClienteDropdownButton({Key? key, required this.callback}) : super(key: key);
  
  final Function(ClienteModel) callback;

  @override
  _ClienteDropdownButtonState createState() => _ClienteDropdownButtonState();
}

class _ClienteDropdownButtonState extends State<ClienteDropdownButton> {
  
  late ClienteModel clienteSelecionado = new ClienteModel(id: 1, nome: 'Matheus', email: 'ma@gmail.com');
  
  List<ClienteModel> clientes = [
    ClienteModel(id: 1, nome: "Matheus" , email: "ma@gmail.com"),
    ClienteModel(id: 2, nome: "Nadir"   , email: "na@gmail.com"),
    ClienteModel(id: 3, nome: "Letícia" , email: "le@gmail.com"),
    ClienteModel(id: 4, nome: "Carlos"  , email: "ca@gmail.com"),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(12)),
      child: DropdownButton<int>(
        value: clienteSelecionado.id,
        icon: RotatedBox(
          quarterTurns: 1,
          child: Icon(Icons.chevron_right, color: Colors.deepPurple)
        ),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.black),
        underline: Container(
          height: 2,
          color: Colors.deepPurple,
        ),
        hint: Text("Selecione o cliente", 
          style: TextStyle(color: Colors.deepPurple)
        ),
        onChanged: (idSelecionado) {
          setState(() {
            clienteSelecionado = clientes.firstWhere((cliente) => cliente.id == idSelecionado);
          });
          widget.callback(clienteSelecionado);
        },
        items: clientes.map<DropdownMenuItem<int>>((ClienteModel cliente) {
          return DropdownMenuItem<int>(
            value: cliente.id,
            child: Text(cliente.nome),
          );
        }).toList(),
      ),
    );
  }
}