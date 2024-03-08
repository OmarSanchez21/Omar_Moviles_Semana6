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
        title: Text('Predicción de Genero'),
      ),
      body: Center(
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
                child: Text('Predecir su Genero')),
            SizedBox(
              height: 20,
            ),
            Text(
                'No se puede definir mi genero solo por el nombre pero segun la api soy:'),
            loading
                ? CircularProgressIndicator()
                : gender.isNotEmpty
                    ? gender == 'male'
                        ? Container(
                            child: Text('Soy un macho hombre peludo'),
                            width: 100,
                            height: 100,
                            color: Colors.blue,
                          )
                        : Container(
                            child: Text('Soy una damicela'),
                            width: 100,
                            height: 100,
                            color: Colors.pink,
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
