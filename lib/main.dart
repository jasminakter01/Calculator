import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main(){
  runApp(Main_Claculate());
}

class Main_Claculate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter Demo",
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new Home_Calculate(
title: "Calculator",
      ),
    );
  }
}

class Home_Calculate extends StatefulWidget {
  Home_Calculate({Key key,this.title});

  final String title;
  @override
  _Home_CalculateState createState() => _Home_CalculateState();
}

class _Home_CalculateState extends State<Home_Calculate> {

  String output="0";
String _output="0";
double num1=0.0;
double num2=0.0;
String oparend="";

buttonpressed(String buttonText){
  if(buttonText=="CLEAR"){
    _output="0";
      num1=0.0;
     num2=0.0;
    oparend="";
  }else if(buttonText=="+"|| buttonText=="-"||buttonText=="X"||buttonText=="/"){
    num1=double.parse(output);
    oparend=buttonText;
    _output="0";


  }else if(buttonText=="."){
    if(_output.contains(".")){
      print("Allready Contains a decimals");
      return;
    }else{

      _output=_output+buttonText;
    }
  }else if(buttonText=="="){
    num2=double.parse(output);
    if(oparend=="+"){
      _output=(num1+num2).toString();
    } if(oparend=="-"){
      _output=(num1-num2).toString();
    } if(oparend=="X"){
      _output=(num1*num2).toString();
    } if(oparend=="/"){
      _output=(num1/num2).toString();
    }

    num1=0.0;
    num2=0.0;
    oparend="0";

  }else{
    _output=_output+buttonText;
  }
  print(_output);
  setState(() {
   output= double.parse(_output).toStringAsFixed(2);
  });
}

  Widget buildButton(String buttonText){
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(buttonText,
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        onPressed: () {
buttonpressed(buttonText);
        },
        /*
        color: Colors.blueGrey,
        textColor: Colors.white,*/
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(

child: new Column(children: <Widget>[
  new Container(
      alignment: Alignment.centerRight,
      padding: new EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 12.0
      ),
      child: new Text(output,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 48),)
  ),
    //vertical space er jonno expanded use kor hoy
  new Expanded(
child: new Divider(),
  ),



        new Column(

          children:<Widget> [
             new Row(
    children:<Widget> [
      buildButton("7"),
      buildButton("8"),
      buildButton("9"),
      buildButton("/")
    ],
    ),
            new Row(
              children:<Widget> [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("X")
              ],
            ),
            new Row(
              children:<Widget> [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-")
              ],
            ),
            new Row(
              children:<Widget> [
                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("+")
              ],
            ),
            new Row(
              children:<Widget> [
                buildButton("CLEAR"),
                buildButton("="),
              ],
            ),

   ],
        )
],

),

      ),
    );
  }
}

