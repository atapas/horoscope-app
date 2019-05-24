import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/screenArguments.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => new _ResultPageState();
}

  
class _ResultPageState extends State<ResultPage> {
  
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    print(args.message);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(args.title),

      ),
      body: new Center(
        child: new ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
            new Text(
                args.message
            ),
            new RaisedButton(onPressed:(){
              goToHomePage(context);
            } ,child: new Text("Back to Home Page"),)
          ]
        )
        
        
        /*new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(onPressed:(){
              goToHomePage(context);
            } ,child: new Text("Back to Home Page"),)
          ],
        ),*/
      ) ,
    );
  }

  void goToHomePage(BuildContext context){
    print("goToHomePage");
    Navigator.of(context).pop(true);
  }
}