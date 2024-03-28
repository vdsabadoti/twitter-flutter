import 'package:first/Providers/posts_provider.dart';
import 'package:first/twitter_body.dart';
import 'package:first/twitter_footer.dart';
import 'package:first/twitter_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'class/Tweet.dart';
import 'http_request.dart';

class TwitterHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.network(
                      'https://cdn-icons-png.freepik.com/256/13051/13051786.png')
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Twitter",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: const Color.fromRGBO(88, 176, 240, 1),
        ),
        body: Column(
          children: [
            Header(),
            Expanded(child: PostsBody()),
            const Footer(),
          ],
        ),
      );
  }
}
