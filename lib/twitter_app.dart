import 'package:first/Providers/login_provider.dart';
import 'package:first/twitter_home.dart';
import 'package:first/twitter_login.dart';
import 'package:first/twitter_new_tweet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/UserModel.dart';

class TwitterApp extends StatelessWidget {
  const TwitterApp({super.key});

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Wrapper(),
          '/tweets': (context) => TwitterHome(),
          '/newpost': (context) => NewTweet(),
        },);
    }
  }

  class Wrapper extends StatelessWidget {
    const Wrapper({super.key});

    @override
    Widget build(BuildContext context) {

      bool loggedIn = context.watch<LoginProvider>().loggedIn();

      if (loggedIn){
        return TwitterHome();
      }
      return const Login();
    }
  }
