import 'package:flutter/material.dart';

class TwitterPosts extends StatelessWidget {

  final String imageSource;
  final String username;
  final String post;

  const TwitterPosts({
    super.key, required this.imageSource, required this.username, required this.post,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //many cards
        SizedBox(
          height: 150,
          child: Row(
            children: [
              SizedBox(
                width: 150,
                child: Image.network(
                    imageSource
                  //'https://picsum.photos/250?image=9'
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(username),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('50s'),
                        )
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(post
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],),
        ),
        const Row(
          children: [
            Expanded(child: TweetButton('Répondre')),
            Expanded(child: TweetButton('Retweet')),
            Expanded(child: TweetButton('Favoris')),
          ],
        )
      ],
    );
  }
}

class TweetButton extends StatelessWidget {

  final String title;

  const TweetButton(this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: Text(title));
  }
}