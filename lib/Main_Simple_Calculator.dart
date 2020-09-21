import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp(Calculator_App());
}

class Calculator_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      theme: ThemeData(primarySwatch: Colors.red),
      home: SimpleCalculator(),
    );
  }
}
class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();

}

class _SimpleCalculatorState extends State<SimpleCalculator> {

  String equation="";
  String result="";
  String expression="";
  double equationFontSize=38.0;
  double resultFontSize=48.0;

  buttonPressed(String buttonText) {

    setState(() {
      equationFontSize=48;
      resultFontSize=22;
      if(buttonText=="⌫"){


        equation=equation.substring(0,equation.length-1);


        expression=equation;

        // expression.replaceAll(from, '/');
        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm=ContextModel();
          result='${exp.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){
          result="";
        }


        if(equation==""){
          equation="0";
          result="0";
        }
      }


      else if(buttonText=="C"){
        equation="0";
        result="0";
        equationFontSize=38;
        resultFontSize=48;
      }



      else if(buttonText=="."||buttonText=="0"||buttonText=="00"||buttonText=="1"||buttonText=="2"||buttonText=="3"||buttonText=="4"||buttonText=="5"||buttonText=="6"||buttonText=="7"||buttonText=="8"||buttonText=="9") {
        if(equation=="0"){
          equation= buttonText;}
        else{
          equation=equation+buttonText;
          expression=equation;

          // expression.replaceAll(from, '/');
          try{
            Parser p = Parser();
            Expression exp = p.parse(expression);
            ContextModel cm=ContextModel();
            result='${exp.evaluate(EvaluationType.REAL, cm)}';
          }catch(e){
            result="";
          }
        }


      }


      else if(buttonText=="="){
        equationFontSize=22;
        resultFontSize=48;
        expression=equation;

        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm=ContextModel();
          result='${exp.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){
        /* int l=equation.length  ;
         int ll=l-1;
         int lll=l-2;
         print("lll${l}");
         print("lll${ll}");
         print("lll${lll}");
         String p=equation.substring(ll);
         print("${p}");
         print("${equation.substring(lll)}");*/
//equation.replaceAll("+-", "-");
       //  print("${p}");
      //   print("${equation}");


result="";

          /*if(buttonText=="+"){
            String p=equation.substring(l,1);


          }*/
        }
      }

      else {



        equationFontSize=48;
        resultFontSize=38;
        if(equation=="0"){
          equation= buttonText;
        }
        else{
          equation=equation+buttonText;
        }

      }
    });
  }

  Widget buildButton(String buttonText,double buttonHeight,Color buttonColor){
    return Container(
      height:  MediaQuery.of(context).size.height * 0.1*buttonHeight,
      color: buttonColor,
      child: FlatButton(

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),

              side: BorderSide(

                  color: Colors.white12,
                  width: 1,
                  style: BorderStyle.solid,


              )

          ),
          padding: EdgeInsets.all(16.0),
          onPressed: ()=>buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                color: Colors.black
            ),
          )
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Calculator"),),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation,style: TextStyle(fontSize: equationFontSize),),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(result,style: TextStyle(fontSize: resultFontSize),),
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
                          buildButton("C", 1, Colors.white),
                          buildButton("⌫", 1, Colors.white),
                          buildButton("/", 1, Colors.white),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("7", 1, Colors.white),
                          buildButton("8", 1, Colors.white),
                          buildButton("9", 1, Colors.white),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("4", 1, Colors.white),
                          buildButton("5", 1, Colors.white),
                          buildButton("6", 1, Colors.white),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("1", 1, Colors.white),
                          buildButton("2", 1, Colors.white),
                          buildButton("3", 1, Colors.white),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton(".", 1, Colors.white),
                          buildButton("0", 1, Colors.white),
                          buildButton("00", 1, Colors.white),
                        ]
                    )

                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*.25,
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          buildButton("*", 1, Colors.white),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("-", 1, Colors.white),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("+", 1, Colors.white),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("=", 2, Colors.white),
                        ]
                    )
                  ],
                ),
              )
            ],
          )



        ],
      ),


    );
  }
}

