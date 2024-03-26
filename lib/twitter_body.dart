import 'package:first/twitter_posts.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {

  static const List<Widget> twitterPostsList = [
    TwitterPosts(imageSource: 'https://picsum.photos/250?image=9', username: '@crocante', post: 'content content content content content content'),
    TwitterPosts(imageSource: 'https://picsum.photos/250?image=9', username: '@crocante', post: 'content content content content content content'),
    TwitterPosts(imageSource: 'https://picsum.photos/250?image=9', username: '@crocante', post: 'content content content content content content'),
    TwitterPosts(imageSource: 'https://picsum.photos/250?image=9', username: '@crocante', post: 'content content content content content content'),
    TwitterPosts(imageSource: 'https://picsum.photos/250?image=9', username: '@crocante', post: 'content content content content content content'),
    TwitterPosts(imageSource: 'https://picsum.photos/250?image=9', username: '@crocante', post: 'content content content content content content'),
    TwitterPosts(imageSource: 'https://picsum.photos/250?image=9', username: '@crocante', post: 'content content content content content content'),
  ];

  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: twitterPostsList.length,
        itemBuilder: (BuildContext context, int index) {
          return twitterPostsList[index];
        }
    );
  }
}