import 'package:flutter/cupertino.dart';

import '../class/Tweet.dart';


class NewPostsProvider with ChangeNotifier {

  final List<String> _items = ['Politics', 'International', 'Culture', 'Sport'];
  String _itemSelected = 'Politics';
  DateTime _selectedDate = DateTime.now();

  NewPostsProvider();

  String itemSelected() => _itemSelected;
  List<String> items() => _items;
  DateTime selectedDate() => _selectedDate;

  void selectItem(String newValue){
    _itemSelected = newValue;
    notifyListeners();
  }

  void updateDate(DateTime newDate){
    _selectedDate = newDate;
    notifyListeners();
  }

  Tweet newTweet(Tweet tweetInProgress){
    tweetInProgress.date = _selectedDate;
    tweetInProgress.category = _itemSelected;
    return tweetInProgress;
  }
}