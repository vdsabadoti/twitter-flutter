import 'package:first/twitter_footer.dart';
import 'package:first/twitter_header.dart';
import 'package:first/twitter_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TwitterApp extends StatelessWidget {
  const TwitterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Twitter",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromRGBO(88, 176, 240, 1),
        ),
        body: const Column(
          children: [
            Header(),
            Expanded(child: Body()),
            Footer(),
          ],
        ),
      ),
    );
  }
}