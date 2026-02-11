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

  factory User.fromJsonOne(dynamic json) {
    
    var _userId    = json['userId'];
    var _id        = json['id'];
    var _title     = json['title'];
    var _completed = json['completed'] ;
    var _user      = new User( _userId,_id,_title,_completed );
    
    return _user;
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
    return '{ ${this.userId}, ${this.id}, ${this.title}, ${this.completed} }';
  }

}
