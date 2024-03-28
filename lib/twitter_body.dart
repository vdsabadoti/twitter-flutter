import 'package:first/twitter_posts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/posts_provider.dart';
import 'class/Tweet.dart';
import 'http_request.dart';

class PostsBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final List<Tweet> tweets = context
        .watch<PostsProvider>()
        .tweets;

    final bool refresh = context
        .watch<PostsProvider>()
        .refresh;

    if (refresh){
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: tweets.length,
                itemBuilder: (BuildContext context, int index) {
                  return TwitterPosts(
                    imageSource: 'https://picsum.photos/250?image=9',
                    username: tweets[index].author,
                    post: tweets[index].message,
                  );
                }),
          ),
        ],
      );
    } else {
      return const Column(
          children: [
            Expanded(child: Center(
              child: CircularProgressIndicator(),
            ))
            ],
      );
    }


  }
}
