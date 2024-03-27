import 'package:first/twitter_body.dart';
import 'package:first/twitter_footer.dart';
import 'package:first/twitter_header.dart';
import 'package:first/twitter_posts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import 'class/Tweet.dart';
import 'http_request.dart';

class TwitterHome extends StatefulWidget {

  TwitterHome({
    super.key,
  });

  @override
  State<TwitterHome> createState() => _TwitterHomeState();
}

class _TwitterHomeState extends State<TwitterHome> {

  List<Tweet> tweets = [];


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { onRefresh(); });
    super.initState();
  }

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
          Header(onRefresh),
          Expanded(child: PostsBody(tweets)),
          const Footer(),
        ],
      ),
    );
  }

    onRefresh() async {
      ProgressDialog pd = ProgressDialog(context: context);
      pd.show(msg : 'Loading tweets');
      await Future.delayed(Duration(seconds: 1));
      tweets = await HttpRequestTwitter.getTweets();
      pd.close();
      setState(() { });
  }
}
