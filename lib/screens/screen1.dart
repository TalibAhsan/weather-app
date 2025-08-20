import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:twoo_climate/screens/screen2.dart';

class Screen1 extends StatefulWidget {
  final dynamic weatherdata;
  const Screen1({super.key, required this.weatherdata});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  var apiKey = "c851c913170746ef92067d086814619e";
  var cityName;
  var currentWeather;
  var tempInCel;
  String emoji = "";
  @override

  void initState(){
    print(widget.weatherdata['name']);
    updateUI(widget.weatherdata);
    super.initState();
  }
  Widget build(BuildContext context) {
    
      var width = MediaQuery.of(context).size.width;
      var height = MediaQuery.of(context).size.height;
      return Scaffold(
      body: Container(
        width:width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/screen1.jpeg'),fit: BoxFit.cover),
          
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      print("ButtonPressed");
                      print(widget.weatherdata['weather'][0]['main']);
                      updateUI(widget.weatherdata);
                    },
                    icon: const Icon(
                      Icons.near_me,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width:10),
                  IconButton(
                    onPressed: () async{
                      var cityName =  await Navigator.push(context, MaterialPageRoute(builder: (_) => Screen2()));
                      print(cityName);
                      if(cityName != Null ||  cityName != "" ){
                        var weatherData = getWeatherDataFromCityName(cityName);
                        setState(() {
                          updateUI(widget.weatherdata);
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.location_on,
                      size: 40,
                      color: Colors.white,

                    ),
                  ),
                ],
              ),
              Text(
                cityName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
               Text(
                currentWeather,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                tempInCel+ "°",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Clouds",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,                
                      ),),
                      
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "$emoji",
                              style: TextStyle(
                                fontSize: 70,
                              ),)
                          ],
                        ),
                      
                      

                      
                ],
              ),
              
            ],
          )),

      ),
    );
  }

  String kelvinToCel(var temp){
    var tempInCel = temp - 273.15;
    String tempInString = tempInCel.floor().toString();
    return tempInString;
  }
  void getWeatherDataFromCityName(String cityNmae) async{
    var cityWeatherAPI = "https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API Key}";
      var url = Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {
          'q': cityNmae,
          'appid': apiKey
        }
      );

      print(url);
      var response = await http.get(url);
        var data = response.body;
          var weatherData  = jsonDecode(data);
          updateUI(weatherData);
      
}

void updateUI(weatherData){
  var weatherid = weatherData['weather'][0]['id'];
   if(weatherid>200 && weatherid<300){
    setState(() {
      emoji = "🌩️";
    });
   }
   else if(weatherid>300 && weatherid<400){
    setState(() {
      emoji = "⛈️";
    });
   }
   if(weatherid>500 && weatherid<600){
    setState(() {
      emoji = "🌧️";
    });
   }
   if(weatherid>700 && weatherid<800){
    setState(() {
      emoji = "☁️";
    });
   }
   if(weatherid>=800){
    setState(() {
      emoji = "☁️";
    });
   }
   setState(() {
     var temp = weatherData['main']['temp'];
     tempInCel = kelvinToCel(temp);
     currentWeather = weatherData['weather'][0]['main'];
     cityName = weatherData['name'];
   });
}
}