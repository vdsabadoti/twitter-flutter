import 'dart:convert';
import 'package:first/class/Tweet.dart';
import 'package:http/http.dart' as http;

class HttpRequestTwitter {

  static String twitterPosts = 'https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json';

  HttpRequestTwitter();

  static getTweets() async {
    //get a response
    var response = await http.get(Uri.parse(twitterPosts));
    //print the response body
    print(response.body);
    //parse
    final parsedJson = jsonDecode(response.body);
    //Iterate the list to get a Map<String, dynamic>
    final listJson = (parsedJson as List<dynamic>)
        .map((dynamic e) => (e as Map<String, dynamic>));
    //Iterate to get objects from
    final listTweets = listJson.map((e) => Tweet.fromJson(e)).toList();
    // print the type and value
    print('JSON OBJ => ${listJson.runtimeType} : $listJson');
    print('TWEET OBJ => ${listTweets.runtimeType} : $listTweets');


    return listTweets;
  }

}