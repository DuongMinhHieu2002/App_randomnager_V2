import 'package:flutter/material.dart';
import 'dart:math';
class RandomYesNopage extends StatefulWidget {
  @override
  _RandomYesNopageState createState() => _RandomYesNopageState();
}

class _RandomYesNopageState extends State<RandomYesNopage> {
  List<int> _History = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();


  void addHistory(int input) {
    setState(() {
      _History.add(input);
    });
  }
  String result = '';


  void generateRandomAnswer() {

    Future.delayed(Duration(seconds: 0), () {
      final random = Random();
      bool randomBool = random.nextBool();
      setState(() {
        result = randomBool ? 'Yes' : 'No';
      });
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          result= ''; // Ẩn dòng chữ sau 1 giây
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Scaffold(
       backgroundColor: Color(0xff392850),
        body: Column(
          children: [
            SizedBox(
              height: 60,
            ),
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
            SizedBox(
              height: 80,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(result,style: TextStyle(fontSize: 150,color: Colors.white),),
                    SizedBox(height: 200.0),
                    ElevatedButton(
                      onPressed: generateRandomAnswer,
                      child: Text(
                        'Yes or NO',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: Colors.white),
                        ),
                        backgroundColor: Colors.transparent.withOpacity(0),
                      ),
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
