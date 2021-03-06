import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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
        primarySwatch: Colors.deepPurple,
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
  String _equation = "";
  String _result = "";
  String _expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText)
  {
    setState(() {
      if(buttonText == "C")
        {
          _equation = 0.toString();
          _result = 0.toString();
          equationFontSize = 38.0;
          resultFontSize = 48.0;
        }
      else if(buttonText == "×")
        {
          equationFontSize = 48.0;
          resultFontSize = 38.0;
          _equation = _equation.substring(0, _equation.length - 1);
          if(_equation == "")
            {
              _equation = 0.toString();
            }
        }
      else if(buttonText == "=")
        {
          equationFontSize = 38.0;
          resultFontSize = 48.0;

          _expression = _equation;
          _expression = _expression.replaceAll("÷", "/");

          try
          {
            Parser p = Parser();
            Expression exp = p.parse(_expression);

            ContextModel cm = ContextModel();
            _result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          }catch(e)
          {
            _result = "Error";
          }
        }
      else
        {
          equationFontSize = 48.0;
          resultFontSize = 38.0;
          if(_equation == "0")
            {
              _equation = buttonText;
            }
          else
            {
              _equation = _equation + buttonText;
            }
        }
    });
  }

  Widget CustomButton(String btnText, double btnHeight, Color btnColor)
  {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * btnHeight,
      color: btnColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: BorderSide(
            color: Colors.white,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        padding: EdgeInsets.all(15.0),
        onPressed: () => buttonPressed(btnText),
        child: Text(
          "$btnText",
          style: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white,
          ),
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
              child: Text("$_equation", style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: equationFontSize,
              ),),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Text("$_result", style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: resultFontSize,
              ),),
            ),
            Expanded(
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          CustomButton("C", 1.0, Colors.redAccent),
                          CustomButton("×", 1.0, Colors.deepPurple),
                          CustomButton("÷", 1.0, Colors.deepPurple),
                        ],
                      ),
                      TableRow(
                        children: [
                          CustomButton("7", 1.0, Colors.black54),
                          CustomButton("8", 1.0, Colors.black54),
                          CustomButton("9", 1.0, Colors.black54),
                        ],
                      ),
                      TableRow(
                        children: [
                          CustomButton("4", 1.0, Colors.black54),
                          CustomButton("5", 1.0, Colors.black54),
                          CustomButton("6", 1.0, Colors.black54),
                        ],
                      ),
                      TableRow(
                        children: [
                          CustomButton("1", 1.0, Colors.black54),
                          CustomButton("2", 1.0, Colors.black54),
                          CustomButton("3", 1.0, Colors.black54),
                        ],
                      ),
                      TableRow(
                        children: [
                          CustomButton(".", 1.0, Colors.black54),
                          CustomButton("0", 1.0, Colors.black54),
                          CustomButton("00", 1.0, Colors.black54),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Table(
                  children: [
                    TableRow(
                      children: [
                        CustomButton("*", 1.0, Colors.deepPurple),
                      ],
                    ),
                    TableRow(
                      children: [
                        CustomButton("+", 1.0, Colors.deepPurple),
                      ],
                    ),
                    TableRow(
                      children: [
                        CustomButton("-", 1.0, Colors.deepPurple),
                      ],
                    ),
                    TableRow(
                      children: [
                        CustomButton("=", 2.0, Colors.deepPurple),
                      ],
                    ),
                  ]
                ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}

