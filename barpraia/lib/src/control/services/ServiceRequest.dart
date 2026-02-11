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

class ServiceRequest {

  ServiceRequest(url){
    this._url=url;
  }

  Dio             _dio = Dio();
  late Response   _response; 
  late String     _url; 
  late String     _responseJson;

  Future<dynamic> get(int pItem) async {

    User _ret = new User(0,0,"",false);
    
    try {

      var url = _url+'$pItem';

      _dio.options.responseType = ResponseType.plain;

      _response = await _dio.get(url);

      if (_response.statusCode==200){
    
        _responseJson = _response.data;

        Map<String, dynamic> userMap = jsonDecode(_responseJson.toString());

        User user = User.fromJson(userMap);
        var useTitle = user.title;

        _ret = user;
      }
        
    } catch (e) {
        print(e);
    }
    return _ret;
  }


}
