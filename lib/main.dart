import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(ColorApp());
}

class ColorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "My app color", home: ColorPage());
  }
}

class ColorPage extends StatefulWidget {
  @override
  _ColorPageState createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  var currentColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: randomColor,
      child: Scaffold(
        body: AnimatedContainer(
          duration: Duration(seconds: 1),
          color: currentColor,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)
              ),
              width: 150,
              height: 50,
              child: Center(
                child: Text(
                  "Hey there!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.blur_linear),
          onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=>GradientPage(),
                )
            );
          },
        ),
      ),
    );
  }

  void randomColor() {
    setState(() {
      var rand = new Random();
      //First way
      currentColor = Color.fromARGB(
          255,
          rand.nextInt(256),
          rand.nextInt(256),
          rand.nextInt(256)
      );
      //Second way
      //currentColor = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    });
  }
}
class GradientPage extends StatefulWidget {
  @override
  _GradientPageState createState() => _GradientPageState();
}

class _GradientPageState extends State<GradientPage> {
  Color gradientColor1 = Colors.deepPurple;
  Color gradientColor2 = Colors.red;
  Color gradientColor3 = Colors.yellowAccent;
  Color gradientColor4 = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Gradient page")
      ),
      body:GestureDetector (
          onTap: gradientRandom,
          child:AnimatedContainer(
            duration: Duration(seconds: 1),
            decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                gradientColor1,
                gradientColor2,
                gradientColor3,
                gradientColor4
             ]
            )
          ),
        )
      )
    );
  }
  void gradientRandom(){
    setState(() {
      var rand = new Random();
      gradientColor1 = Color.fromARGB(255,rand.nextInt(256),rand.nextInt(256),rand.nextInt(256));
      gradientColor2 = Color.fromARGB(255,rand.nextInt(256),rand.nextInt(256),rand.nextInt(256));
      gradientColor3 = Color.fromARGB(255,rand.nextInt(256),rand.nextInt(256),rand.nextInt(256));
      gradientColor4 = Color.fromARGB(255,rand.nextInt(256),rand.nextInt(256),rand.nextInt(256));
    });
  }
}

