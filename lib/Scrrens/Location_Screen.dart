import 'package:flutter/material.dart';
import 'package:clima_app/services/weather.dart';
import 'City_Screen.dart';
import 'myClipper.dart';
class locationScreen extends StatefulWidget {
  locationScreen({this.locationWeather});
  final locationWeather ;
  @override
  _locationScreenState createState() => _locationScreenState();
}

class _locationScreenState extends State<locationScreen> {
  WeatherModel weather = WeatherModel();
  var temperature;
  String weatherIcon;
  String cityName;
  String weatherMessage;
    @override
    void initState()  {
      super.initState();
      updateUI(widget.locationWeather);

    }

    void updateUI(dynamic weatherData){
      setState(() {
        if (weatherData == null) {
          temperature = 0;
          weatherIcon = 'Error';
          weatherMessage = 'لايوجد صلاحية لجلب المعلومات';
          cityName = '';
          return;
        }
        var temp = weatherData['main']['temp'];
        temperature = temp.toInt();
        var condition = weatherData['weather'][0]['id'];
        weatherIcon = weather.getWeatherIcon(condition);
        weatherMessage = weather.getMessage(temperature);
        cityName = weatherData['name'];
      });

    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar:true ,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
          children : [
            Column(
                children: [
                    ClipPath(
                     clipper: MyClipper(),
                     child: Container(
                     padding: EdgeInsets.only(top: 50, right: 20, left: 40),
                      width: double.infinity,
                          height: 350,
                           decoration: BoxDecoration(
                             color: Color(0xFF6200EE),
                           ),
                       child:Center(
                         child: Container(
                           margin: EdgeInsets.only(left: 20 , right: 20),
                           child: Row(
                             children: [
                               Text('$temperature' , style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 50,
                               ),),
                               SizedBox(width: 5,),
                               Text('°',style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 50,
                               ),),
                               SizedBox(width: 5,),
                               Text(weatherIcon),
                               SizedBox(width: 90,),
                               Image(image: AssetImage('assets/image/cloud.png'),
                                 height: 65,
                                 width: 65,
                               ),
                             ],
                           ),
                         ),
                       ),
                     ),
                           ),
                       Container(
                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(36) ,
                         color: Color(0xFF0336FF),
                         ),
                        // padding: EdgeInsets.all(5),
                        // margin: EdgeInsets.only(left: 10 , right: 10 , top: 20),
                         height: 80,
                         width: 300,
                         child: Center(
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Image.asset('assets/image/location.png' , height: 55 , width: 55, color: Colors.white,),
                               Text(cityName , style: TextStyle(
                                 fontSize: 20 ,
                                 color: Colors.white,
                                 fontWeight: FontWeight.bold,
                               ),),
                             ],
                           ),
                         ),
                       ),
                       SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(36) ,
                      color: Color(0xFF0336FF),
                    ),
                    height: 90,
                    width: 300,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(weatherIcon , ),
                          Text(weatherMessage , style: TextStyle(
                            fontSize: 20 ,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),),
                        ],

                      ),
                    ),
                  ),
                   SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(36) ,
                      color: Color(0xFF6200EE),
                    ),
                    margin: EdgeInsets.only(left: 10 , right: 10 , top: 20),
                    height: 60,
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(onPressed: () async{
                          var weatherData = await weather.getLocationWeather();
                          updateUI(weatherData);
                        },
                          icon:Icon(Icons.near_me),
                          color: Colors.white,
                          iconSize: 45,
                        ),
                        IconButton(onPressed: () async {
                          var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context) => cityScreen()));
                         if (typedName != null){
                           var weatherData = await weather.getweatherCity(typedName);
                           updateUI(weatherData);
                         }
                          },
                          
                          icon:Icon(Icons.location_city),
                          color: Colors.white,
                          iconSize: 45,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 80,),
                    Center(
                      child: Text('REWAN NASHAT OMAR' , style: TextStyle(
                        color: Colors.black,
                        fontSize: 18 ,
                        fontWeight: FontWeight.w800,
                      ),),
                    ),
                     ],),
      ],),
    );
  }
}
