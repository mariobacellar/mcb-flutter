class ClienteModel {
  
  late int id;
  late String nome;
  late String email; 

  ClienteModel( {required this.id, required this.nome, required this.email}) ;

  ClienteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
  }

 Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    return data;
  }


}