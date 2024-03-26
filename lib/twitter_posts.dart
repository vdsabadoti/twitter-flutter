import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(username),
                              ),
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
            Expanded(child: TweetIconButton('Répondre')),
            Expanded(child: TweetIconButton('Retweet')),
            Expanded(child: TweetIconButton('Favoris')),
          ],
        )
      ],
    );
  }
}

class TweetIconButton extends StatelessWidget {

  final String title;

  const TweetIconButton(this.title, {
    super.key,
  });

  Icon getIcon() {
    switch (title) {
      case 'Répondre':
        return Icon(Icons.reply);
      case 'Retweet':
        return Icon(Icons.repeat);
      case 'Favoris':
        return Icon(Icons.star);
      default:
        return Icon(Icons.volcano);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: getIcon(),
      color: CupertinoColors.systemGrey,
    );
  }
}