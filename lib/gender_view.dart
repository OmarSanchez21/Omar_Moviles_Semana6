import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GenderPrediction extends StatefulWidget {
  @override
  _GenderPredictionState createState() => _GenderPredictionState();
}

class _GenderPredictionState extends State<GenderPrediction> {
  String name = '';
  String gender = '';
  bool loading = false;

  Future<void> predictGender(String name) async {
    setState(() {
      loading = true;
    });

    final response =
    await http.get(Uri.parse('https://api.genderize.io/?name=$name'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        gender = data['gender'];
        loading = false;
      });
    } else {
      setState(() {
        loading = false;
      });
      throw Exception('Fallo en obtener el genero');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predicción de Género'),
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
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                await predictGender(name);
              },
              child: Text('Predecir Género'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'No se puede definir mi género solo por el nombre pero según la API soy:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            loading
                ? CircularProgressIndicator()
                : gender.isNotEmpty
                ? Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                gender == 'male' ? Colors.blue : Colors.pink,
              ),
              child: Center(
                child: Text(
                  gender == 'male' ? 'Macho hombre peludo' : 'Damicela',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
                : SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
