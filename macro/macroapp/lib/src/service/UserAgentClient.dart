// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

class UserAgentClient extends http.BaseClient {
  
  final String userAgent;
  final http.Client _inner;

  UserAgentClient(this.userAgent, this._inner);

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['user-agent'] = userAgent;
    print("_inner:" + _inner.toString());

    return _inner.send(request);
  }
}
