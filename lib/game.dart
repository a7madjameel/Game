import 'dart:math';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int userImageChoice = 0;
  int systemImageChoice = 1;
  List<String> images = ['rock.png', 'paper.png', 'scissor.png'];
  int userScore = 0;
  int systemScore = 0;
  String roundResult = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'userScore / systemScore',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Score: $userScore / $systemScore',
                style: const TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  setState(() {
                    userScore = 0;
                    systemScore = 0;
                    roundResult = '';
                  });
                },
                child: const Text(
                  'Restart',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  userImageChoice = Random().nextInt(3);
                  systemImageChoice = Random().nextInt(3);
                  if (systemImageChoice == userImageChoice) {
                    roundResult = 'Result of the round: Draw';
                  } else if (systemImageChoice == 0 && userImageChoice == 1 ||
                      systemImageChoice == 1 && userImageChoice == 2 ||
                      systemImageChoice == 2 && userImageChoice == 0) {
                    userScore++;
                    roundResult = 'Result of the round: you Win';
                  } else {
                    systemScore++;
                    roundResult = 'Result of the round: Computer Win';
                  }
                });
              },
              child: Image.asset('images/${images[userImageChoice]}'),
            ),
            const Text(
              'vs',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            Image.asset('images/${images[systemImageChoice]}'),
            const SizedBox(height: 70),
          ],
        ),
        Text(
          roundResult,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
