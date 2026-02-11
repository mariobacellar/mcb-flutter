import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_auth/flutter_auth.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final storage = new FlutterSecureStorage();
  bool _isAuthenticated = false;
  String _accessToken;
  String _refreshToken;

  @override
  void initState() {
    super.initState();
    checkAuthentication();
  }

  void checkAuthentication() async {
    _accessToken = await storage.read(key: "access_token");
    _refreshToken = await storage.read(key: "refresh_token");
    if (_refreshToken != null) {
      setState(() {
        _isAuthenticated = true;
      });
    }
  }

  Future<void> authenticate() async {
    final response = await FlutterAuth.authenticate(
      clientId: 'your_client_id',
      clientSecret: 'your_client_secret',
      redirectUri: 'your_redirect_uri',
      scope: 'your_scope',
      responseType: 'code',
    );
    setState(() {
      _isAuthenticated = true;
      _accessToken = response.accessToken;
      _refreshToken = response.refreshToken;
    });
    await storage.write(key: "access_token", value: _accessToken);
    await storage.write(key: "refresh_token", value: _refreshToken);
  }

  Future<void> logout() async {
    setState(() {
      _isAuthenticated = false;
      _accessToken = null;
      _refreshToken = null;
    });
    await storage.delete(key: "access_token");
    await storage.delete(key: "refresh_token");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Oauth 2.0 Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Oauth 2.0 Example'),
        ),
        body: Center(
          child: _isAuthenticated
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Access Token: $_accessToken',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Refresh Token: $_refreshToken',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        logout();
                      },
                      child: Text('Logout'),
                    ),
                  ],
                )
              : ElevatedButton(
                  onPressed: () {
                    authenticate();
                  },
                  child: Text('Login with Oauth 2.0'),
                ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Cadastro de Usuário',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Implementar funcionalidade de cadastro
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
