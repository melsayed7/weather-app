import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({Key? key}) : super(key: key);

  //WeatherModel? model;
  @override
  Widget build(BuildContext context) {
    List<WeatherModel>? model =
        Provider.of<WeatherProvider>(context).listWeatherModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next 5 Days'),
      ),
      body: Consumer<WeatherProvider>(
        builder: (context, value, _) {
          return value.listWeatherModel == null
              ? Container()
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildWeatherItem(model![index]),
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 2.0,
                  ),
                  itemCount: model!.length,
                );
        },
      ),
    );
  }

  Widget buildWeatherItem(WeatherModel model) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      model.date.toString(),
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      model.weatherStateName.toString(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Image.asset(model.getImage()),
                Column(
                  children: [
                    Text(
                      'MaxTemp : ${model.maxTemp!.toInt().toString()}',
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'MinTemp : ${model.minTemp!.toInt().toString()}',
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
}
