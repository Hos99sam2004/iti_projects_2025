import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_projects/myapps/news/Const.dart';
import 'package:iti_projects/myapps/news/Screen.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;
  int root = 0;
  Api api = Api();
  bool isvalid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(102, 98, 98, 1),
              Color.fromRGBO(78, 76, 76, 1),
              Color.fromRGBO(42, 41, 41, 1),
              Color.fromRGBO(10, 10, 10, 1),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.info, color: Colors.white, size: 30),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Information'),
                              content: Text('This is a counter app.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(width: 20),
                    IconButton(
                      icon: Icon(Icons.settings, color: Colors.white, size: 30),
                      onPressed: () async {
                         await api.GetData();
                        print("${api.GetData()}");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Screen()),
                        ); // Navigate to the settings page when the button is pressed'/settings');
                      },
                    ),
                    SizedBox(width: 20),
                    IconButton(
                      icon: Icon(Icons.refresh, color: Colors.white, size: 30),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "$root",
                  style: TextStyle(fontSize: 350, color: Colors.white),
                ),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            counter++;
                            if (sqrt(counter) % 1 == 0 && counter > 0) {
                              isvalid = true;
                              root = sqrt(counter).toInt();
                            } else {
                              isvalid = false;
                            }
                          });
                        },
                        icon: Icon(Icons.add, color: Colors.white, size: 50),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$counter',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        SizedBox(height: 10),
                        Text(
                          isvalid
                              ? 'Available'.toUpperCase()
                              : "Not Available".toUpperCase(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            counter--;
                            if (sqrt(counter) % 1 == 0 && counter >= 0) {
                              isvalid = true;
                              root = sqrt(counter).toInt();
                            } else {
                              isvalid = false;
                            }
                          });
                        },
                        icon: Icon(Icons.remove, color: Colors.white, size: 50),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
