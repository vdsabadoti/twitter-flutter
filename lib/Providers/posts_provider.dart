import 'package:flutter/cupertino.dart';

import '../class/Tweet.dart';
import '../http_request.dart';

class PostsProvider with ChangeNotifier {

  List<Tweet> tweets = [];

  void loadPosts() async {
    tweets = await HttpRequestTwitter.getTweets();
    notifyListeners();
  }

}