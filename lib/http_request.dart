import 'dart:convert';
import 'package:first/class/Tweet.dart';
import 'package:http/http.dart' as http;

class HttpRequestTwitter {

  static String twitterPosts = 'https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json';

  HttpRequestTwitter();

  static getTweets() async {

    var response = await http.get(Uri.parse(twitterPosts));

    final parsedJson = jsonDecode(response.body);

    final listJson = (parsedJson as List<dynamic>)
        .map((dynamic e) => (e as Map<String, dynamic>));

    final listTweets = listJson.map((e) => Tweet.fromJson(e)).toList();

    return listTweets;
  }

}