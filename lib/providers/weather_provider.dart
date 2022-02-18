import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier
{
  WeatherModel? model;
  String? cityName;

  set weatherData (WeatherModel? weather)
  {
    model = weather ;
    notifyListeners();
  }

  WeatherModel? get weatherData => model ;
}