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

class _HomePageState extends State<HomePage>
{
  int firstNum;
  int secondNum;
  String result;
  String textToDisplay = "";
  String operationToPerform;

  // button click function
  void btnClicked(String btnText)
  {
    if(btnText == "C")
      {
        firstNum = 0;
        secondNum = 0;
        textToDisplay = "";
        result = "";
      }
    else if(btnText == "+" || btnText == "-" || btnText == "x" || btnText == "/")
      {
        firstNum = int.parse(textToDisplay);
        result = "";
        operationToPerform = btnText;
      }
    else if(btnText == "=")
      {
        secondNum = int.parse(textToDisplay);
        if(operationToPerform == "+")
          {
            result = (firstNum + secondNum).toString();
          }
        if(operationToPerform == "-")
          {
            result = (firstNum - secondNum).toString();
          }
        if(operationToPerform == "x")
          {
            result = (firstNum * secondNum).toString();
          }
        if(operationToPerform == "/")
          {
            result = (firstNum / secondNum).toString();
          }
      }
    else
      {
        result = int.parse(textToDisplay + btnText).toString();
      }
  }

  SetState()
  {
    textToDisplay = result;
  }

  //custom button design
  Widget custom_Button(String btn_Value)
  {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(10.0),
        child: MaterialButton(
          onPressed: () {
            btnClicked(btn_Value);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Text("0", style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30.0,
              ),),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Text("0", style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30.0,
              ),),
            ),

          ],
        ),
      );
  }
}

