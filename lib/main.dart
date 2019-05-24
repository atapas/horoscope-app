import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async' show Future;
import 'dart:convert';

import 'models/preditctionModel.dart';
import 'models/horoscopeModel.dart';
import 'services/zodiacService.dart';


void main() => runApp(new PredictionApp());

class PredictionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Prediction',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Prediction'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _allDurations = <String>['', 'Today', 'Week', 'Month', 'Year'];
  
  String _duration = '';
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    nameController.dispose();
    dobController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter your full name',
                      labelText: 'Name',
                    ),
                  ),
                  new TextFormField(
                    controller: dobController,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.calendar_today),
                      hintText: 'Enter your date of birth(dd/mm/yyyy)',
                      labelText: 'Dob',
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                  new TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.phone),
                      hintText: 'Enter a phone number',
                      labelText: 'Phone',
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),
                  new TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.email),
                      hintText: 'Enter a email address',
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.color_lens),
                          labelText: 'Duration',
                        ),
                        isEmpty: _duration == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: _duration,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _duration = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _allDurations.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: new RaisedButton(
                        child: const Text('Submit'),
                        onPressed: () {
                          processInput(
                            new PredictionData(nameController.text
                              , dobController.text
                              , phoneController.text
                              , emailController.text
                              , _duration)
                            );
                        },
                      )),
                ],
              ))),
    );
  }

  void processInput(predictionData) async {
    String _dob = predictionData.getDob();
    String zodiacSign = new Zodiac().getSign(_dob);

    print(predictionData.getFullName() 
        + "\n"
        +  _dob
        + "\n"
        + predictionData.getPhone() 
        + "\n"
        + predictionData.getEmail()
        + "\n"
        + predictionData.getDuration()
        + "\n"
        + zodiacSign);

    final response = await http.get('http://horoscope-api.herokuapp.com/horoscope/' + predictionData.getDuration().toLowerCase() + '/' + zodiacSign);
    print(response.body);
    final responseJson = json.decode(response.body); 
    Horoscope horoscope = new Horoscope.fromJson(responseJson);
    

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the user has typed in using our
            // TextEditingController
            content: Text(horoscope.horoscope),
          );
        },
      );
  }

}