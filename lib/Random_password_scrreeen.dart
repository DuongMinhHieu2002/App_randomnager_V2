import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

class RandomPasswordScreen extends StatefulWidget {
  const RandomPasswordScreen({Key? key}) : super(key: key);

  @override
  State<RandomPasswordScreen> createState() => _RandomPasswordScreenState();
}

class _RandomPasswordScreenState extends State<RandomPasswordScreen> {

  bool _showSpecialCharacters = false;
  String _password = '';
  bool _excludeNumbers = false;
  bool _shortPassword = false;
  bool _longPasword = false;
  bool _uppercaseOnly = false;
  bool _useCustomCharacters = false;
  String _customCharacters = '';

  int _length = 17;

  bool _iconBool = false;

  ThemeData _lightTheme = ThemeData(
      primarySwatch: Colors.amber,
      brightness: Brightness.light
  );
  ThemeData _darkTheme = ThemeData(
      primarySwatch: Colors.deepOrange,
      brightness: Brightness.dark
  );
  IconData _iconLight = Icons.wb_sunny;
  IconData _iconDark = Icons.nights_stay;

  void _generatePassword() {
    String chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    if (_showSpecialCharacters) {
      chars += '!@#\$%^&*()';
    }

    final String numbers = '0123456789';
    final Random rand = Random();
    String newPassword = '';

    if (_shortPassword) {
      setState(() {
        _length = 9;

      });
    }
    if (_longPasword){
      setState(() {
        _length=17;

      });
    }

    for (int i = 0; i < _length; i++) {
      String char = chars[rand.nextInt(chars.length)];
      if (_uppercaseOnly && !_useCustomCharacters) {
        char = char.toUpperCase();

      }
      else if (_useCustomCharacters && _customCharacters.isNotEmpty) {
        chars='';
        chars += _customCharacters;
        if (_uppercaseOnly){
          chars=chars.toUpperCase();
        }
        if (_showSpecialCharacters){
          chars = chars + '!@#\$%^&*()';
        }
      }
      if (_excludeNumbers ) {
        chars += numbers;}
      newPassword += char;

    }
    newPassword = newPassword.substring(1);
    setState(() {
      _password = newPassword;

    });
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _password));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied to clipboard'),
        duration: Duration(seconds: 1),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff392850),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon:Icon( Icons.arrow_back),
                    color: Colors.white,
                    alignment: Alignment.centerLeft),
              ],
            ),
            SizedBox(height: 10,),
            Stack(
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 3,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          '$_password',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _password='';
                          });
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Generate my Password'),
              onPressed: _generatePassword,
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.white),
                ),
                backgroundColor: Colors.transparent.withOpacity(0),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Copy to your Clipboard'),
              onPressed: _copyToClipboard,
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.white),
                ),
                backgroundColor: Colors.transparent.withOpacity(0),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child:  SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 15),
                        Text('Custom length password',style: TextStyle(color: Colors.white),),
                        SizedBox(width: 10),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.transparent),
                          ),
                          child: FloatingActionButton(
                            onPressed: () {
                              if (_length>9){
                                setState(() {
                                  _length --;
                                });
                              }
                            },
                            child: Icon(Icons.remove),
                            mini: true,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Center(
                            child: Text(
                              '${_length - 1}',
                              style: TextStyle(fontSize: 20,color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.transparent),
                          ),
                          child: FloatingActionButton(
                            onPressed: () {
                              if (_length<19){
                                setState(() {
                                  _length++;
                                });
                              }
                            },
                            child: Icon(Icons.add),
                            mini: true,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: _excludeNumbers,
                          onChanged: (bool? value) {
                            setState(() {
                              _excludeNumbers = value ?? false;
                            });
                          },
                          side: BorderSide(
                            color: Colors.white, // Màu viền khi chưa được chọn
                            width: 2.0, // Độ dày của viền
                          ),
                        ),
                        Text('Include numbers',style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: _shortPassword,
                          onChanged: (bool? value) {
                            setState(() {
                              _shortPassword = value ?? false;
                              _longPasword = false;
                              _length = 9;
                            });
                          },
                          side: BorderSide(
                            color: Colors.white, // Màu viền khi chưa được chọn
                            width: 2.0, // Độ dày của viền
                          ),
                        ),
                        Text('Short password',style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    SizedBox(height: 20 ,),
                    Row(
                      children: [
                        Checkbox(
                          value: _longPasword,
                          onChanged: (bool? value) {
                            setState(() {
                              _longPasword = value ?? false;
                              _shortPassword = false;
                              _length = 17;
                            });
                          },
                          side: BorderSide(
                            color: Colors.white, // Màu viền khi chưa được chọn
                            width: 2.0, // Độ dày của viền
                          ),
                        ),
                        Text('Long password',style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: _uppercaseOnly,
                          onChanged: (bool? value) {
                            setState(() {
                              _uppercaseOnly = value ?? false;
                            });
                          },
                          side: BorderSide(
                            color: Colors.white, // Màu viền khi chưa được chọn
                            width: 2.0, // Độ dày của viền
                          ),
                        ),
                        Text('Uppercase only',style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _showSpecialCharacters,
                          onChanged: (bool? value) {
                            setState(() {
                              _showSpecialCharacters = value ?? false;
                            });
                          },
                          side: BorderSide(
                            color: Colors.white, // Màu viền khi chưa được chọn
                            width: 2.0, // Độ dày của viền
                          ),
                        ),
                        Text('Show special characters',style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    SizedBox(height: 20,),
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
