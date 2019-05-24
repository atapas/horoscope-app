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
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          children: <Widget>[
            /*new IconButton(icon: Icon(Icons.monetization_on)),*/
            new RichText(
              text: new TextSpan(
                  text: 'Hello ' + args.name.trim() +', Your Zodiac Sign is: ' + args.sign,
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  )
              ),
            ),
            new Image(
              image: new AssetImage("assets/" + args.sign.toLowerCase() + ".png"),
              fit: BoxFit.none
            ),
            
            new RichText(
              text: new TextSpan(
                  text: 'Your Horoscope goes like:\n',
                  style: new TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            
            new RichText(
              text: new TextSpan(
                  text: args.message + '\n',
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontFamily: 'Proxima Nova'
                  )
              ),
            ),

            new RaisedButton(
              onPressed:(){
                goToHomePage(context);
              } ,
              child: new Text(
                "Back to Home Page"
              ),
            )
          ]
        )
      ) ,
    );
  }

  void goToHomePage(BuildContext context){
    print("goToHomePage");
    Navigator.of(context).pop(true);
  }
}