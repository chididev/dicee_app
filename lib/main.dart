import 'package:flutter/material.dart';
import 'dart:math';

//The main function is the starting point of our app.
void main() {
  runApp(const MyApp());
}

//The stateless widget gives us access to Google Flutter hot reload and hot refresh
//properties.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //This is the basic design of the app and it is quite constant.
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.red.shade900,
          leading: const Icon(
            Icons.gamepad,
            color: Colors.white,
            size: 30.0,
          ),
          title: const Center(
            child: Text(
              'DICEE',
              style: TextStyle(
                letterSpacing: 5.0,
              ),
            ),
          ),
        ),
        body: const DicePage(),
      ),
    );
  }
}

//The stateful widget allows our app to refresh on the go and update the build.
class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  @override
  Widget build(BuildContext context) {
    //These variables control the dice number. They make use of the dart maths
    //library to randomize the integers.
    int rightDice = Random().nextInt(6)+1;
    int leftDice = Random().nextInt(6)+1;

    //The diceRoll function actually calls the setState method which rebuilds
    //our stateful widget and updates the dice when it is rolled.
    diceRoll() {
      setState((){
        rightDice;
        leftDice;
      });
    }
    //The column houses the row which contains the dice images in an expanded
    // widget
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('images/dice$leftDice.png'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('images/dice$rightDice.png'),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 50.0,
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            primary: Colors.black,
          ),
          onPressed: () {
           diceRoll();
          },
          child: const Text(
            'Click to Roll',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}
