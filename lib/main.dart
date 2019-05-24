import 'package:flutter/material.dart';

import 'pages/homePage.dart';
import 'pages/resultPage.dart';


void main() => runApp(new PredictionApp());

class PredictionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Prediction',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new HomePage(title: 'Prediction'),
       routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => new HomePage(),
        '/result' : (BuildContext context) => new ResultPage()
      },
    );
  }
}
