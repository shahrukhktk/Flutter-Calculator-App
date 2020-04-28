import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator App",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    Widget custom_Button(String btn_Value)
    {
      return Expanded(
        child: OutlineButton(
          padding: EdgeInsets.all(15.0),
          child: MaterialButton(
            onPressed: () {
            },
            child: Text("$btn_Value", style: TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
            ),
//            color: Colors.purple,
            height: 50.0,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(10.0),
                child: Text("Output",
                style: TextStyle(
                    fontSize: 25.0, 
                    fontWeight: FontWeight.w600
                ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                custom_Button("9"),
                custom_Button("8"),
                custom_Button("7"),
                custom_Button("+"),
              ],
            ),
            Row(
              children: <Widget>[
                custom_Button("6"),
                custom_Button("5"),
                custom_Button("4"),
                custom_Button("-"),
              ],
            ),
            Row(
              children: <Widget>[
                custom_Button("3"),
                custom_Button("2"),
                custom_Button("1"),
                custom_Button("x"),
              ],
            ),
            Row(
              children: <Widget>[
                custom_Button("C"),
                custom_Button("0"),
                custom_Button("="),
                custom_Button("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

