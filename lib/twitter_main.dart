import 'package:first/Providers/posts_provider.dart';
import 'package:first/twitter_posts.dart';
import 'package:first/twitter_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (context) => PostsProvider()),
      ],
      child: const TwitterApp()));
}