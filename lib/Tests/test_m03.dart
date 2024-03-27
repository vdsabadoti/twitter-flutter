import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(
          title : Text('My first app'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    height: 1300,
                    decoration: const BoxDecoration(
                    color : Colors.green,
                  ),
                    child: Image.network("src")
                  ),
                Container(
                  height: 1300,
                    decoration: const BoxDecoration(
                      color : Colors.red,
                    )),
                        ]
              ),
            ),
          
          ),
        )

      )

    );
  }
}
