import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:geocoding/geocoding.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Position _currentPosition= Position();
  late String _currentAddress="???";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_currentAddress),
            TextButton(
              child: Text("Get location"),
              onPressed: () { 
                _getCurrentLocation();
                
              },
            ),
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() {
    
    setState(() {
      _currentAddress="Obtendo localização ...";  
    });
  
    Geolocator
      .getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best, 
        forceAndroidLocationManager: true)
      .then((Position position) {
        setState(() {
          _currentPosition = position;
          print(position.altitude);
          _getAddressFromLatLng();
        });
      }).catchError((e) {
        print(e);
      });
  }

  _getAddressFromLatLng() async {
    try {

      List<Placemark> placemarks = await placemarkFromCoordinates( _currentPosition.latitude, _currentPosition.longitude );

      Placemark place = placemarks[0];

      String tmp= "$_currentPosition"; 

      setState(() {
        _currentAddress = "$tmp, ${place.postalCode}, ${place.country}";
print("_currentPosition=[$_currentPosition]");
print("_currentAddress=[$_currentAddress]");
print("place.locality}=[$place.locality}]");
      });

    } catch (e) {
      print(e);
    }
  }
}
