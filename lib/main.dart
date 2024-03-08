import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:semana6_api/clima_view.dart';
import 'package:semana6_api/university_view.dart';
import 'package:semana6_api/wordpressview.dart';
import 'gender_view.dart';
import 'age_view.dart';
import 'me_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: ToolOptions(),
    );
  }
}

class ToolOptions extends StatefulWidget {
  @override
  _ToolOptionsState createState() => _ToolOptionsState();
}

class _ToolOptionsState extends State<ToolOptions> {
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seleccione una opción'),
          content: SizedBox(
            height: 400,
            width: 600,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              children: [
                _buildToolItem(
                  context,
                  GenderPrediction(),
                  FontAwesomeIcons.peopleGroup,
                  'Predicción de Género',
                ),
                _buildToolItem(
                  context,
                  AgePrediction(),
                  FontAwesomeIcons.plus,
                  'Predicción de Edad',
                ),
                _buildToolItem(
                  context,
                  UniversityPage(),
                  FontAwesomeIcons.university,
                  'Universidad',
                ),
                _buildToolItem(
                  context,
                  WeatherPage(),
                  FontAwesomeIcons.cloud,
                  'Clima',
                ),
                _buildToolItem(
                  context,
                  WordPressPage(),
                  FontAwesomeIcons.wordpress,
                  'Noticias de WordPress',
                ),
                _buildToolItem(
                  context,
                  MePage(),
                  FontAwesomeIcons.idCard,
                  'Ajustes',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildToolItem(
      BuildContext context,
      Widget page,
      IconData icon,
      String title,
      ) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              icon,
              size: 50,
              color: Colors.deepPurple,
            ),
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caja de Herramientas'),
      ),
      body: Center(
        child: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.toolbox,
            size: 50,
          ),
          onPressed: () {
            _showDialog(context);
          },
        ),
      ),
    );
  }
}
