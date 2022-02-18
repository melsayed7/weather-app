import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screen/search_screen.dart';
import 'package:weather_app/screen/weather_screen.dart';
import 'package:weather_app/services/weather_services.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  WeatherModel? model;
  String? cityName ;
  @override
  Widget build(BuildContext context) {
    model = Provider.of<WeatherProvider>(context).weatherData ;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchScreen()));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Provider.of<WeatherProvider>(context, listen: true).model == null
          ? buildEmptyWeather()
          : buildWeatherItem(),
    );
  }

  Widget buildEmptyWeather() => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
      );

  Widget buildWeatherItem() => Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          model!.getThemeColor(),
          model!.getThemeColor()[300]!,
          model!.getThemeColor()[100]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 100,),
      child: Column(
        children: [
           Text(
            Provider.of<WeatherProvider>(context).cityName!,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Text(
                'Updated ',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                "${model!.time!.hour.toString()}" ":" "${model!.time!.minute.toString()}",
                style:const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Text(
            model!.date.toString(),
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(model!.getImage()),
              const SizedBox(
                width: 20,
              ),
              Text(
                model!.temp!.toInt().toString(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'MinTemp : ',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        model!.minTemp!.toInt().toString(),
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'MaxTemp : ',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        model!.maxTemp!.toInt().toString(),
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            model!.weatherStateName.toString(),
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
             [
               const Text(
                'Next 5 days forecast information',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
               TextButton(
                   onPressed: () async{
                     Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherScreen(),));
                   WeatherService service = WeatherService();
                   WeatherModel? weather = await service.getAllDataWeather(cityName: cityName!);
                   Provider.of<WeatherProvider>(context,listen: false).weatherData = weather ;
                   },
                   child: const Text(
                     'Click Here',
                     style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                       decoration: TextDecoration.underline,
                     ),
                   ),
               ),
            ],
          ),
        ],
      ),
    ),
  );
}
