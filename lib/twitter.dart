import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const TwitterApp());
}

class TwitterApp extends StatelessWidget {
  const TwitterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Twitter",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromRGBO(88, 176, 240, 1),
        ),
        body: Column(
          children: [
            Container(
              child: NavBar(),
            ),
            Container(
              child: Column(
                children: [
                  //many cards
                  Row(
                    children: [
                      Expanded(
                          flex : 1,
                          child: Image.network(
                              'https://picsum.photos/250?image=9'
                          )),
                      const Expanded(
                          flex : 3,
                          child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Username@Title'),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('50s'),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Content Content Content Content Content Content Content Content Content Content Content Content '
                                      'Content Content Content Content Content'),
                                )
                              ],
                      ),
                      ),
                  ],),
                  Row(
                    children: [
                      Expanded(child: TweetButton('Répondre')),
                      Expanded(child: TweetButton('Retweet')),
                      Expanded(child: TweetButton('Favoris')),
                      ],
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.all(25.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: TextFooter('Fil')),
              Expanded(
                  child: TextFooter('Notifications')),
              Expanded(
                  child: TextFooter('Messages')),
              Expanded(
                  child: TextFooter('Moi'))
            ],
          ),
        ),
      ),
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

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: const Padding(
        padding: EdgeInsets.all(25.0),
        child: Row(
          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: TextNavBar('Nouveau')),
            Expanded(
                child: TextNavBar('Accueil')),
            Expanded(
                child: TextNavBar('Rechercher')),
          ],
        ),
      ),
    );
  }
}

class TextFooter extends StatelessWidget {

  final String title;

  const TextFooter(this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: const TextStyle(color: CupertinoColors.inactiveGray),
        ));
  }
}

class TextNavBar extends StatelessWidget {

  final String title;

  const TextNavBar(this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
                      onPressed: () {},
                      child: Text(
    title,
    style: const TextStyle(color: Colors.white),
                      ),
                    );
  }
}
