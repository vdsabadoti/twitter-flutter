import 'package:first/twitter_posts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'class/Tweet.dart';
import 'http_request.dart';

class PostsBody extends StatefulWidget {

  List<Tweet> tweets;

  PostsBody(
    this.tweets, {
    super.key,
  });

  @override
  State<PostsBody> createState() => _PostsBodyState();
}

class _PostsBodyState extends State<PostsBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: widget.tweets.length,
              itemBuilder: (BuildContext context, int index) {
                return TwitterPosts(
                  imageSource: 'https://picsum.photos/250?image=9',
                  username: widget.tweets[index].author,
                  post: widget.tweets[index].message,
                );
              }),
        ),
      ],
    );
  }
}
