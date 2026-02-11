//import 'package:macroapp/src/models/User.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class UserService {
  //const UserService({Key? key}) : super(key: key);
  String host;
  String uri;

  UserService({required this.host, required this.uri}); 

  var usersList = [];

  userRequest() async {
    print('-> userRequest()');
    try {
      
      var _url = Uri.https(this.host, this.uri, {'q': '{http}'});
      print('Request to URL: ['+_url.toString()+']');

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(_url);

      if (response.statusCode == 200) {

        print('##### response.body: $response.body');

        var jsonResponse= convert.jsonDecode(response.body) as Map<String, dynamic>;
        var itemCount     = jsonResponse['totalItems'];
        print('##### Number of books about http: $itemCount.');
        print('##### jsonResponse: $jsonResponse');



      } else {
        print('Request failed with status: ${response.statusCode}.');
      }

      print('<- userRequest()');
    } catch (e) {
      print("##### DEU ERRO ######");
      print(e);
    }
  }
}
