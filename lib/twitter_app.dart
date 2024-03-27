import 'package:first/twitter_home.dart';
import 'package:first/twitter_login.dart';
import 'package:flutter/material.dart';

class TwitterApp extends StatelessWidget {
  const TwitterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/tweets' : (context) => const TwitterHome(),
      },
    );
  }
}