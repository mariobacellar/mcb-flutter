class User {

  int?    userId;
  int?    id;
  String? title;
  bool?   completed;

  User(this.userId, this.id, this.title, this.completed);

  User.fromJson(Map<String, dynamic> json) {
    userId    = json['userId'];
    id        = json['id'];
    title     = json['title'];
    completed = json['completed'];
  }

  factory User.fromJsonOne(Map<String, dynamic> json) {
    return User(
    json['userId']    as int, 
    json['id']        as int,
    json['title']     as String,
    json['completed'] as bool);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> 
    data              = new Map<String, dynamic>();
    data['userId']    = this.userId;
    data['id']        = this.id;
    data['title']     = this.title;
    data['completed'] = this.completed;
    return data;
  }

  @override
  String toString() {
    return '{\n\t"userId": "${this.userId}",\n\t"id": "${this.id}",\n\t"title": "${this.title}",\n\t"completed":"${this.completed}"\n }';
  }

}


// import 'dart:convert';

// void main() {
 
//   var jsonUser = "{\"nome\":\"mario\", \"tel\":\"010101010\"}";
//   Map<String, dynamic> userMap = jsonDecode(jsonUser);
//   User user = User.fromJson(userMap);
//   String struser = user.toString();
//   print("User parsed = $struser");
  
  
//   var jsonUserList = "{\"users\": [ {\"nome\":\"mario\",\"tel\":\"010101010\"}, {\"nome\":\"bacellar\", \"tel\":\"020202020\" } ] }";
//   var usersjson    = jsonDecode(jsonUserList)['users'] as List;
//   List<User> users = usersjson.map((uJson) => User.fromJson(uJson)).toList(); 
//   print(users); 

// }


// class User {
//   String nome;
//   String tel;

//    User(this.nome, this.tel);

//   factory User.fromJson(dynamic json) {
//     return User( json['nome'] as String, json['tel'] as String);
//   }

//   String toString() {
//     return '{ ${this.nome}, ${this.tel} }';
//   }

// }


