import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchScreen extends StatelessWidget {

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body:  Padding(
        padding:  const EdgeInsets.all(15.0),
        child: Center(
          child: TextField(
            onChanged: (value) {
              cityName = value;
            },
            onSubmitted: (value) async{
              cityName = value;
              WeatherService service = WeatherService();
              WeatherModel? weather = await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context,listen: false).weatherData = weather ;
              Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;

              Navigator.pop(context);
            },
            decoration:  InputDecoration(
              contentPadding: const EdgeInsets.all(30.0) ,
              label: const Text('Search'),
              hintText: 'Enter Your City',
              border: const OutlineInputBorder(),
              suffixIcon: GestureDetector(
                onTap: () async{
                  WeatherService service = WeatherService();
                  WeatherModel? weather = await service.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context,listen: false).weatherData = weather ;
                  Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;
                  Navigator.pop(context);
                },
                  child: const Icon(Icons.search)
              ),

            ),
          ),
        ),
      ),
    );
  }
}

