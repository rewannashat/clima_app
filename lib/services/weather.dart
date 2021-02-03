import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/networking.dart';
const apiKey = '3e1386682651c26f824ccf6bfa184c08' ;
class WeatherModel{
      Future<dynamic> getweatherCity(String cityName) async{
               NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
               var weatherData = await networkHelper.getData();
               return weatherData ;

       }
  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper network = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await network.getData();
    return weatherData ;
  }


      String getWeatherIcon(int condition) {
        if (condition < 300) {
          return '🌩';
        } else if (condition < 400) {
          return '🌧';
        } else if (condition < 600) {
          return '☔️';
        } else if (condition < 700) {
          return '☃️';
        } else if (condition < 800) {
          return '🌫';
        } else if (condition == 800) {
          return '☀️';
        } else if (condition <= 804) {
          return '☁️';
        } else {
          return '🤷‍';
        }
      }
String getMessage(int temp){
  if(temp>25){
    return ' !! حان وقت المثلجات🍦 ';
  } else if(temp>20){
    return 'بامكانك ارتداء ملابس خفيفة';
  } else if(temp<10){
    return 'تحتاج الى مظلة أثناء الخروج';
  } else {
    return 'الجو بارد! ارتدي معطف من فضلك';
  }
}

}