import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:twoo_climate/screens/screen1.dart';
import 'package:twoo_climate/services/location.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    if(mounted){
      getLocation();
    }
    
  }

  void getLocation() async {
    try {
      Location location = Location();
      await location.getCurrentLocation();
      double? lat = location.latitude;
      double? lon = location.longitude;

      if (lat == null || lon == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Location not available.')),
        );
        return;
      }

      var apiKey = "c851c913170746ef92067d086814619e";
      var url = Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {
          'lat': lat.toString(),
          'lon': lon.toString(),
          'appid': apiKey,
        },
      );

      print(url);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        Navigator.push(context, MaterialPageRoute(builder:(_) => Screen1(weatherdata: data)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to fetch weather data.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
            color: Colors.grey,
            size: 50,
          ),
        ),
      );
    
  }
}
