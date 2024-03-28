import 'package:flutter/cupertino.dart';

import '../class/Tweet.dart';
import '../http_request.dart';

class PostsProvider with ChangeNotifier {

  List<Tweet> tweets = [];
  bool refresh = true;

  PostsProvider() {
    loadPosts();
  }

  void loadPosts() async {
    refreshPages();
    notifyListeners();
    tweets = await HttpRequestTwitter.getTweets();
    await Future.delayed(Duration(seconds: 1));
    refreshPages();
    notifyListeners();
  }

  void refreshPages(){
    refresh = !refresh;
  }

}