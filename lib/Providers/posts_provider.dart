import 'package:flutter/cupertino.dart';

import '../class/Tweet.dart';
import '../http_request.dart';

class PostsProvider with ChangeNotifier {

  List<Tweet> tweets = [];
  bool refresh = true;
  List<Tweet> tweetsCreatedByUser = [];
  List<Tweet> tweetsFromAPI = [];

  PostsProvider() {
    loadPosts();
  }

  void loadPosts() async {
    refreshPages();
    notifyListeners();
    tweetsFromAPI = await HttpRequestTwitter.getTweets();
    tweets = tweetsCreatedByUser + tweetsFromAPI;
    await Future.delayed(Duration(seconds: 1));
    refreshPages();
    notifyListeners();
  }

  void refreshPages(){
    refresh = !refresh;
  }

  void addPost(Tweet tweet){
    tweetsCreatedByUser.add(tweet);
    tweets = tweetsCreatedByUser + tweetsFromAPI;
    notifyListeners();
  }

}