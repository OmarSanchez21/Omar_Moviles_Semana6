import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender_view.dart';
import 'age_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  ToolOptions(),
    );
  }
}

class ToolOptions extends StatefulWidget{
  @override
  _ToolOptionsState createState() => _ToolOptionsState();
}

class _ToolOptionsState extends State<ToolOptions>{
  void _showDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Seleccione una opción'),
            content: SizedBox(
              height: 400,
              width: 600,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                children: [
                  InkWell(
                    hoverColor: Colors.red,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GenderPrediction())
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.peopleGroup),
                        title: Text('age Prediction'),
                      ),
                    ),
                  ),
                  InkWell(
                    hoverColor: Colors.red,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AgePrediction())
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.peopleGroup),
                        title: Text('Gender Prediction'),
                      ),
                    ),
                  ),
                  InkWell(
                    hoverColor: Colors.red,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GenderPrediction())
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.peopleGroup),
                        title: Text('Gender Prediction'),
                      ),
                    ),
                  ),
                  InkWell(
                    hoverColor: Colors.red,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GenderPrediction())
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.peopleGroup),
                        title: Text('Gender Prediction'),
                      ),
                    ),
                  ),
                  InkWell(
                    hoverColor: Colors.red,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GenderPrediction())
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.peopleGroup),
                        title: Text('Gender Prediction'),
                      ),
                    ),
                  ),
                  InkWell(
                    hoverColor: Colors.red,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GenderPrediction())
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.peopleGroup),
                        title: Text('Gender Prediction'),
                      ),
                    ),
                  ),
                ],
              ),
            )
          );
        });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Caja de Herramienta'),
      ),
      body: Center(
        child: IconButton(
          icon: FaIcon(FontAwesomeIcons.toolbox),
          onPressed: (){
            _showDialog(context);
          },
        ),
      ),
    );
  }
}
