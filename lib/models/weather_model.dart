import 'package:flutter/material.dart';

class WeatherModel {
  String? weatherStateName;
  String? date ;
  DateTime? time;
  double? temp;
  double? minTemp;
  double? maxTemp;

  WeatherModel(
      { this.weatherStateName,
        this.date,
       this.time,
       this.temp,
       this.minTemp,
       this.maxTemp});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      weatherStateName: json['weather_state_name'],
      date : json['applicable_date'],
      time:DateTime.parse( json['created']),
      temp: json['the_temp'],
      minTemp: json['min_temp'],
      maxTemp: json['max_temp'],
    );
  }

  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }


  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder' ){
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
