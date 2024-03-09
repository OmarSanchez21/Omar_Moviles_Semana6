import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late String _weatherDescription = '';
  late double _temperature = 0.0;
  late String _iconUrl = '';
  late String _mainWeather = '';
  bool _loading = true;

  Future<void> fetchWeather() async {
    final apiKey = '07c2ae6428d78db5522821bd507b9a06';
    final url = Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=Dominican%20Republic&appid=$apiKey&units=metric');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _mainWeather = data['weather'][0]['main'];
        _weatherDescription = data['weather'][0]['description'];
        _temperature = data['main']['temp'];
        _iconUrl = data['weather'][0]['icon'];
        _loading = false;
      });
    } else {
      setState(() {
        _loading = false;
      });
      throw Exception('Fallo en obtener la información del clima');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clima de RD'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: _loading
            ? Center(child: CircularProgressIndicator())
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Estado del tiempo: $_weatherDescription',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Temperatura: $_temperature °C',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            _iconUrl.isNotEmpty
                ? Image.network(
              'http://openweathermap.org/img/w/$_iconUrl.png',
              width: 100,
              height: 100,
            )
                : Container(),
            SizedBox(height: 10),
            Text(
              'Clima principal: $_mainWeather',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
