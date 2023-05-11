import 'package:flutter/material.dart';
import 'dart:math';

class RandomNumberPage extends StatefulWidget {

  @override
  _RandomNumberPageState createState() => _RandomNumberPageState();
}

class _RandomNumberPageState extends State<RandomNumberPage> {
  List<int> _History = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();
  int _randomNumber = 0;

  void addHistory(int input) {
    setState(() {
      _History.add(input);
    });
  }




  void _generateRandomNumber() {
    int start = int.tryParse(_startController.text) ?? 0;
    int end = int.tryParse(_endController.text) ?? 0;
    if (start >= end) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Invalid Input'),
          content: Text('The start value must be less than the end value.'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }
    setState(() {
      _randomNumber = Random().nextInt(end - start + 1) + start;
      addHistory(_randomNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          backgroundColor: Color(0xff453658),
          child: Column(
            children: <Widget>[
              SizedBox(height: 150),
              _History.isEmpty
                  ? Row(
                children: [
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                    'No history available',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )
                ],
              )
                  : Expanded(
                child: ListView.builder(
                  shrinkWrap: false,
                  itemCount: _History.length,
                  itemBuilder: (context, index) {
                    final history = _History[index];
                    return Align(
                      alignment: Alignment.center,
                      child: Text(
                        ' ${history}',
                        style: TextStyle(
                          fontSize: 80,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  SizedBox(
                    width: 107,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _History = [];
                      });
                    },
                    child: Text(
                      'Clear History',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.white),
                      ),
                      backgroundColor: Colors.transparent.withOpacity(0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
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
                      width: 250,
                    ),
                    IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: Icon(Icons.list),
                      color: Colors.white,
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$_randomNumber',
                          style:
                          TextStyle(fontSize: 100.0, color: Colors.white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _startController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Start',
                            labelStyle: TextStyle(color: Colors.white),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal:
                                20.0), // Đặt lề ngang cho phần nội dung
                            // border: OutlineInputBorder(), // Đặt đường viền cho TextField
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _endController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'End',
                            labelStyle: TextStyle(color: Colors.white),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal:
                                20.0), // Đặt lề ngang cho phần nội dung
                            // border: OutlineInputBorder(), // Đặt đường viền cho TextField
                          ),
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: _generateRandomNumber,
                          child: Text(
                            'Generate Random Number',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(200, 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: Colors.white),
                            ),
                            backgroundColor:
                            Colors.transparent.withOpacity(0), //
                          ),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}