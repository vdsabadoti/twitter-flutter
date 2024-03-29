import 'package:first/Providers/posts_provider.dart';
import 'package:first/Services/auth_service.dart';
import 'package:first/twitter_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'Providers/login_provider.dart';
import 'Providers/new_post_provider.dart';
import 'models/UserModel.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostsProvider()),
        ChangeNotifierProvider(create: (context) => NewPostsProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: const TwitterApp()));
}


