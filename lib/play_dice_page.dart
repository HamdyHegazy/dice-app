import 'dart:math';
import 'package:flutter/material.dart';

class PlayDicePage extends StatefulWidget {
  const PlayDicePage({super.key, required this.title});

  final String title;

  @override
  State<PlayDicePage> createState() => _PlayDicePageState();
}

class _PlayDicePageState extends State<PlayDicePage> {
  int dice1 = 1;
  int dice2 = 1;
  int total = 2;
  final String lowResultImagePath = 'assets/images/low_result_face.png';
  final String highResultImagePath = 'assets/images/high_result_face.png';
  void roll() {
    setState(() {
      dice1 = Random().nextInt(6) + 1;
      dice2 = Random().nextInt(6) + 1;
      total = dice1 + dice2;
    });
  }

  void reset() {
    setState(() {
      dice1 = 1;
      dice2 = 1;
      total = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Total is $total',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Image.asset(
            total > 6 ? highResultImagePath : lowResultImagePath,
            width: 200,
            height: 300,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Text(
                  "$dice1",
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                alignment: Alignment.center,
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Text(
                  "$dice2",
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.red),
                  ),
                  onPressed: roll,
                  child: const Text(
                    'Roll Dice',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.red),
                  ),
                  onPressed: reset,
                  child: const Text(
                    'Reset',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
