// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:barpraia/src/model/user_model.dart';

/*
Disable sound null safety using the --no-sound-null-safety flag to the dart or flutter command:
 $ dart --no-sound-null-safety run
 $ flutter run --no-sound-null-safety
Fonte: https://dart.dev/null-safety/unsound-null-safety
*/

abstract class ServiceAbstract {

  ServiceAbstract(this.url);
  
  final String  url; 

  // ignore: unused_field
  Dio dio = Dio();

  // ignore: unused_field
  late Response response; 
  
  // ignore: unused_field
  late String responseJson;



  
  
  Future<dynamic> getAll(); 
  
  Future<dynamic> getOne(int pItem); 
  
}
