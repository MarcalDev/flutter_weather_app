import 'package:flutter/material.dart';
import 'package:flutter_weather_app/1-base/models/Weather.dart';
import 'package:flutter_weather_app/2-app/views/citySelector/pages/CitySelectorPage.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../1-base/models/city.dart';
import '../widgets/MetricsByTimeCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();
  String cityNameText = "Bauru";
  String temperatureText;
  String windText;
  String humidityText;
  String weatherStatusText = "Rainy";
  String weatherStatusImage = "images/cloudSun.png";
  Weather _weather;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020, 8),
        lastDate: DateTime(2023, 8));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt-br');
    return Scaffold(
        backgroundColor: Color(0xfff7f7f7),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(35, 80, 35, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.yMMMMd('pt-br').format(selectedDate),
                    style: TextStyle(fontFamily: 'ProximaNova', fontSize: 13),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    GestureDetector(
                    child: Row(
                      children: [
                        Icon(
                          Icons.place_sharp,
                          size: 22,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            cityNameText,
                            style: TextStyle(fontFamily: 'ProximaNova', fontSize: 20),
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down_rounded),
                      ],
                    ),
                    onTap: () {
                    _navigateAndDisplaySection(context);
                    },
                    ),

                      GestureDetector(
                        child: Icon(
                          Icons.edit_calendar_outlined,
                          size: 25,
                        ),
                        onTap: () => _selectDate(context),
                      )
                    ],
                  )
                ],
              ),
            ),
            FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot != null) {
                  Weather _weather = snapshot.data;
                  if (_weather == null) {
                    return CircularProgressIndicator();
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 35, 0, 10),
                          child: Image.asset(
                            weatherStatusImage,
                            height: 190,
                          ),
                        ),
                        Text(
                          "${_weather.description}",
                          style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'ProximaNova',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(35, 30, 35, 0),
                          child: IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _mainMetricsColumn("Wind", "${_weather.wind}"),
                                VerticalDivider(
                                  color: Colors.black12,
                                  thickness: 2,
                                ),
                                _mainMetricsColumn("Temperature", "${_weather.temp}°C"),
                                VerticalDivider(
                                  color: Colors.black12,
                                  thickness: 2,
                                ),
                                _mainMetricsColumn("Humidity", "${_weather.humidity}%"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                    (_weather);
                  }
                } else {
                  return CircularProgressIndicator();
                }
              },
              future: getCurrentWeather(),
            ),
            Card(
                margin: EdgeInsets.all(0),
                color: Color(0xff2d27dd),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(35, 10, 35, 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 25),
                        child: Divider(
                          color: Colors.white,
                          thickness: 3,
                          endIndent: 130,
                          indent: 130,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MetricsByTimeCard(
                              image: 'images/cloudSun.png',
                              time: "12:00",
                              temperature: "35°C"),
                          MetricsByTimeCard(
                              image: 'images/cloudSun.png',
                              time: "14:30",
                              temperature: "28°C"),
                          MetricsByTimeCard(
                              image: 'images/cloudSun.png',
                              time: "17:00",
                              temperature: "32°C"),
                          MetricsByTimeCard(
                              image: 'images/cloudSun.png',
                              time: "19:30",
                              temperature: "25°C"),
                        ],
                      ),
                    ],
                  ),
                ),
            ),
          ],
        ));
  }

  Column _mainMetricsColumn(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 14, fontFamily: 'ProximaNova', color: Colors.black54),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 25,
            fontFamily: 'ProximaNova',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Future getCurrentWeather() async {
    Weather weather;
    String apiKey = "d86ce5bf6feee49966c473737b980bf6";
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityNameText&appid=$apiKey&units=metric";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      weather = Weather.fromJson(jsonDecode(response.body));
      return weather;
    } else {
      // Error
    }
    return null;
  }

  Future<void> _navigateAndDisplaySection(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CitySelectorPage(cityNameActual: cityNameText)));
    if(result != null || result != ""){
      setState(() {
        cityNameText = result;
      });
    }
  }
}
