import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier
{
  WeatherModel? model;
  List< WeatherModel>? _listWeatherModel;
  String? cityName;

  set weatherData (WeatherModel? weather)
  {
    model = weather ;
    notifyListeners();
  }

  WeatherModel? get weatherData => model ;

  set  listWeatherModel (List< WeatherModel>? weather)
  {
    _listWeatherModel = weather ;
    notifyListeners();
  }

  List< WeatherModel>? get listWeatherModel => _listWeatherModel ;


}