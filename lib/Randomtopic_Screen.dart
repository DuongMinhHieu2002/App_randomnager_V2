import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class RandomTextScreen extends StatefulWidget {
  @override
  _RandomTextScreenState createState() => _RandomTextScreenState();
}

class _RandomTextScreenState extends State<RandomTextScreen> {
  List<String> texts = [
    'Talk about your daily routine',
    'Talk about your trip with someone',
    'How do you spend your weekends?',
    'What are your hobbies?',
    'What do you usually buy?',
    'What’s your favorite means of transportation?',
    'How to keep healthy?',
    'Latest news',
    'What would fix in life',
    'Favorite actor',
    'Pets',
    'Best friends',
    'Bas habits',
    'Qualities in people',
    'Favarite music',
    'Relations',

  ];

  String randomText = '';

  void _generateRandomText() {
    Random random = Random();
    int randomIndex = random.nextInt(texts.length);
    setState(() {
      randomText = texts[randomIndex];
    });

    Timer(Duration(seconds: 1), () {
      setState(() {
        randomText = '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff392850),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 60,),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                ),
                SizedBox(
                  width: 220,
                ),
              ],
            ),
            SizedBox(height: 80,),
            Center(
              child: Text(
                randomText,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 350.0),
            ElevatedButton(
              child: Text('Generate Theme'),
              onPressed: _generateRandomText,
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.white),
                ),
                backgroundColor: Colors.transparent.withOpacity(0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
