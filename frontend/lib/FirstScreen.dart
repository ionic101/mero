import 'package:flutter/material.dart';
import 'Icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                child: Center(
                  child: IconButton(
                    icon: LogoImage,
                    onPressed: () { null;},
                    iconSize: 100,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 250,
                height: 50,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text(
                  'на меро',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
