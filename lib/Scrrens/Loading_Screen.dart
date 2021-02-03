import 'package:clima_app/Scrrens/Location_Screen.dart';
import 'package:clima_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const apiKey = '3e1386682651c26f824ccf6bfa184c08' ;
class loadingScreen extends StatefulWidget {
  @override
  _loadingScreenState createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen>  {
  @override
  void initState(){
    super.initState();
    getLocationData();

  }
  void getLocationData () async{
    WeatherModel weatherLocation = WeatherModel();
    var weatherData =await  weatherLocation.getLocationWeather();
    Future.delayed(
      Duration(seconds: 3),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => locationScreen(locationWeather : weatherData, ),
          ),
        );
      },
    );}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.deepPurpleAccent,
          size: 150,

        ),
      ),
    );
  }
}
