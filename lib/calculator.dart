import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculatorproject/calcbutton.dart';
import 'package:google_fonts/google_fonts.dart';
class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _history = ""; // Store the previous expression
  String _expression = ""; // Store the expression being evaluated



  void numClick (String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear (String text) {
    setState(() {
      _history = "";
      _expression = "";
    });
  }

  void clear (String text) {
    setState(() {
      _expression = "";
    });
  }
  void delete (String text) {
    setState(() {
      _expression=_expression.substring(0,_expression.length-1);
    });
  }

  void evaluate (String text) {
    late String temp;


    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel contextModel = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, contextModel);
    temp = eval.toString();

    // Float checker after then dot
    var newString = temp.substring((temp.length - 2).clamp(0, temp.length));
    if (newString == ".0") {
      temp = temp.substring(0, temp.length - 2);
    }

    setState(() {
      _history = _expression;
      _expression = temp;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2c2c2c),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(right: 12.0),
              child: Text(_history,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 24,
                    color: Color(0xFFfcffff),
                  ),
                ),
              ),
              alignment: Alignment(1 ,1),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              child: Text(_expression,style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 48,color: Colors.white,),),
              ),
              alignment: Alignment(1 ,1),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                CalcButton(
                    text: 'Del',
                    textSize: 18,
                    textColor: 0xFFD4D4D2,
                    fillColor: 0xFF505050,
                    callback: delete,
                )


              ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: "AC",
                  textColor: 0xFFD4D4D2,
                  fillColor: 0xFF505050,
                  textSize: 20.0,
                  callback: allClear,
                ),
                CalcButton(
                  text: "(",
                  fillColor: 0xFF1C1C1C,
                  callback: numClick,
                ),
                CalcButton(
                  text: ")",
                  fillColor: 0xFF1C1C1C,
                  callback: numClick,
                ),
                CalcButton(
                  text: "/",
                  fillColor: 0xFFFF9500,
                  textColor: 0xFFD4D4D2,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: "7",
                  fillColor: 0xFF1C1C1C,
                  textColor: 0xFFD4D4D2,
                  callback: numClick,
                ),
                CalcButton(
                  text: "8",
                  fillColor: 0xFF1C1C1C,
                  textColor: 0xFFD4D4D2,
                  callback: numClick,
                ),
                CalcButton(
                  text: "9",
                  fillColor: 0xFF1C1C1C,
                  textColor: 0xFFD4D4D2,
                  callback: numClick,
                ),
                CalcButton(
                  text: "*",
                  fillColor: 0xFFFF9500,
                  textColor: 0xFFD4D4D2,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: "4",
                  fillColor: 0xFF1C1C1C,
                  textColor: 0xFFD4D4D2,
                  callback: numClick,
                ),
                CalcButton(
                  text: "5",
                  fillColor: 0xFF1C1C1C,
                  textColor: 0xFFD4D4D2,
                  callback: numClick,
                ),
                CalcButton(
                  text: "6",
                  fillColor: 0xFF1C1C1C,
                  textColor: 0xFFD4D4D2,
                  callback: numClick,
                ),
                CalcButton(
                  text: "-",
                  fillColor: 0xFFFF9500,
                  textColor: 0xFFD4D4D2,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: "1",
                  fillColor: 0xFF1C1C1C,
                  textColor: 0xFFD4D4D2,
                  callback: numClick,
                ),
                CalcButton(
                  text: "2",
                  fillColor: 0xFF1C1C1C,
                  textColor: 0xFFD4D4D2,
                  callback: numClick,
                ),
                CalcButton(
                  text: "3",
                  fillColor: 0xFF1C1C1C,
                  textColor: 0xFFD4D4D2,
                  callback: numClick,
                ),
                CalcButton(
                  text: "+",
                  fillColor: 0xFFFF9500,
                  textColor: 0xFFD4D4D2,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: ".",
                  fillColor: 0xFF1C1C1C,
                  textColor: 0xFFD4D4D2,
                  callback: numClick,
                ),
                CalcButton(
                  text: "0",
                  fillColor: 0xFF1C1C1C,
                  textColor: 0xFFD4D4D2,
                  callback: numClick,
                ),
                CalcButton(
                  text: "00",
                  fillColor: 0xFF1C1C1C,
                  textColor: 0xFFD4D4D2,
                  textSize: 17.0,
                  callback: numClick,
                ),
                CalcButton(
                  text: "=",
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF283637,
                  callback: evaluate,
                ),
              ],
            ),
          ],
        ),
    );
  }
}