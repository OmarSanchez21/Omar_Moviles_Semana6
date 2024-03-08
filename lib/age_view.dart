import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgePrediction extends StatefulWidget {
  @override
  _AgePredictionState createState() => _AgePredictionState();
}

class _AgePredictionState extends State<AgePrediction> {
  String name = '';
  int age = 0;
  String ageState = '';

  Future<void> agepredict(String name) async {
    final response =
    await http.get(Uri.parse('https://api.agify.io/?name=$name'));
    final body = json.decode(response.body);
    setState(() {
      age = body['age'];
      if (age < 18) {
        ageState = 'Joven';
      } else if (age < 60) {
        ageState = 'Adulto';
      } else {
        ageState = 'Anciano';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String imageUrl = age < 18
        ? 'https://st5.depositphotos.com/5934840/64745/v/450/depositphotos_647456460-stock-illustration-anime-chibi-happy-boy-character.jpg?${DateTime.now().millisecondsSinceEpoch}'
        : age < 60
        ? 'https://img.pikbest.com/png-images/qiantu/adult-white-collar-cartoon-hand-drawn-female-pattern_2728037.png?${DateTime.now().millisecondsSinceEpoch}'
        : 'https://thumbs.dreamstime.com/z/viejo-icono-de-dibujos-animados-avatar-lindo-vector-ilustraci%C3%B3n-vectorial-210796554.jpg?${DateTime.now().millisecondsSinceEpoch}';

    return Scaffold(
      appBar: AppBar(
        title: Text("Predicción de Edad"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Ingrese el nombre',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                await agepredict(name);
              },
              child: Text('Predecir Edad'),
            ),
            SizedBox(
              height: 20,
            ),
            age != 0
                ? Column(
              children: [
                Text(
                  'Edad: $age',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Estado de vida: $ageState',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.network(
                  imageUrl,
                  width: 300,
                  height: 150,
                ),
              ],
            )
                : Container(
              child: Text(
                'Ocurrió un error al obtener la imagen',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}

