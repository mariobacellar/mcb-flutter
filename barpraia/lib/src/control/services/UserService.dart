// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:barpraia/src/control/services/ServiceAbstract.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:barpraia/src/model/user_model.dart';
import 'package:flutter/material.dart';

/*
Disable sound null safety using the --no-sound-null-safety flag to the dart or flutter command:
 $ dart --no-sound-null-safety run
 $ flutter run --no-sound-null-safety
Fonte: https://dart.dev/null-safety/unsound-null-safety
*/

 class UserService extends ServiceAbstract {

  UserService(String url) : super(url);

  @override
  Future<User> getOne(int pItem) async {

    User _ret = new User(0,0,"",false);
    
    try {

      var tmpurl = url+'$pItem';

      dio.options.responseType = ResponseType.plain;

      response = await dio.get(tmpurl);

      if (response.statusCode==200){
    
        responseJson = response.data;

        Map<String, dynamic> userMap = jsonDecode(responseJson.toString());

        User user = User.fromJson(userMap);

        _ret = user;
      }
        
    } catch (e) {
        print(e);
    }
    return _ret;
  }

  @override
  Future<List<User>> getAll() async {

    List<User> _ret = [];//new User(0,0,"",false);
    
    try {

      this.dio.options.responseType = ResponseType.plain;

      this.response = await this.dio.get(this.url);

      if (response.statusCode==200){

        this.responseJson = this.response.data;

        var usersjson    = jsonDecode(this.responseJson)['users'] as List;
        
        List<User> users = usersjson.map((uJson) => User.fromJson(uJson)).toList(); 
      
        _ret=users; 
      }

      
    } catch (e) {
        print(e);
    }
    return _ret;
  }


//  var jsonUserList = "{\"users\": [ {\"nome\":\"mario\",\"tel\":\"010101010\"}, {\"nome\":\"bacellar\", \"tel\":\"020202020\" } ] }";
//   var usersjson    = jsonDecode(jsonUserList)['users'] as List;
//   List<User> users = usersjson.map((uJson) => User.fromJson(uJson)).toList(); 
//   print(users); 



}
