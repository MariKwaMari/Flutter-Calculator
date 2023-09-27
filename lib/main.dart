import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({Key? key}) : super(key: key);

  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText){
    setState(() {
      if(buttonText == "C"){

      }else if(buttonText == "DEL"){

      }else if(buttonText == "="){

      }else{
        if(equation == "0"){
          equation = buttonText;
        }else {
        equation = equation + buttonText;
        }
      }
    });
  }


  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return Colors.blue.withOpacity(0.04);
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed))
                return Colors.blue.withOpacity(0.12);
              return null; // Defer to the widget's default.
            },
          ),
        ),
        onPressed: () {
          buttonPressed(buttonText);
        },
        child: Text(buttonText,style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
            color:  Colors.white
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Calculator')),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 20, 0),
            child: Text(equation, style: TextStyle(fontSize: 38.0),),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(result, style: TextStyle(fontSize: 48.0),),
          ),

          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * .75,
                  child: Table(
                    children: [
                    TableRow(
                      children: [
                        buildButton("C", 1, Colors.redAccent),
                        buildButton("DEL", 1, Colors.blue),
                        buildButton("÷", 1, Colors.blue),
                      ]
                      ),
                      TableRow(
                          children: [
                            buildButton("7", 1, Colors.black54),
                            buildButton("8", 1, Colors.black54),
                            buildButton("9", 1, Colors.black54),
                          ]
                      ),
                      TableRow(
                          children: [
                            buildButton("4", 1, Colors.black54),
                            buildButton("5", 1, Colors.black54),
                            buildButton("6", 1, Colors.black54),
                          ]
                      ),
                      TableRow(
                          children: [
                            buildButton("1", 1, Colors.black54),
                            buildButton("2", 1, Colors.black54),
                            buildButton("3", 1, Colors.black54),
                          ]
                      ),
                      TableRow(
                          children: [
                            buildButton(".", 1, Colors.black54),
                            buildButton("0", 1, Colors.black54),
                            buildButton("00", 1, Colors.black54),
                          ]
                      ),

                  ]
                  )
                ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("×", 1, Colors.blue),

                      ]
                    ),
                    TableRow(
                        children: [
                          buildButton("+", 1, Colors.blue),

                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("-", 1, Colors.blue),

                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("=", 2, Colors.redAccent),

                        ]
                    )
                  ],
                  )
              )
            ],
          ),
        ],
      )
    );
  }
}
