import 'package:first/twitter_posts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostsBody extends StatefulWidget {

  static const List<Widget> twitterPostsList = [
    TwitterPosts(imageSource: 'https://picsum.photos/250?image=9', username: '@crocante', post: 'content content content content content content'),
    TwitterPosts(imageSource: 'https://picsum.photos/250?image=9', username: '@crocante', post: 'content content content content content content'),
    TwitterPosts(imageSource: 'https://picsum.photos/250?image=9', username: '@crocante', post: 'content content content content content content'),
    TwitterPosts(imageSource: 'https://picsum.photos/250?image=9', username: '@crocante', post: 'content content content content content content'),
    TwitterPosts(imageSource: 'https://picsum.photos/250?image=9', username: '@crocante', post: 'content content content content content content'),
    TwitterPosts(imageSource: 'https://picsum.photos/250?image=9', username: '@crocante', post: 'content content content content content content'),
    TwitterPosts(imageSource: 'https://picsum.photos/250?image=9', username: '@crocante', post: 'content content content content content content'),
  ];

  PostsBody({
    super.key,
  });

  @override
  State<PostsBody> createState() => _PostsBodyState();
}

class _PostsBodyState extends State<PostsBody> {

  final loginForm = GlobalKey<FormState>();
  bool switchValue = false;

  void _switch(){
    setState(() {
      switchValue = !switchValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: PostsBody.twitterPostsList.length,
              itemBuilder: (BuildContext context, int index) {
                return PostsBody.twitterPostsList[index];
              }
          ),
        ),
      ],
    );
  }

}



