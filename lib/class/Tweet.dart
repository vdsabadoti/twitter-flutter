import 'package:json_annotation/json_annotation.dart';

part 'Tweet.g.dart';

@JsonSerializable()
class Tweet{

  int id;
  String author;
  String message;
  DateTime? date;
  String? category;

  Tweet(this.id, this.author, this.message);

  static Tweet fromJsonStatic(Map<String, dynamic> json){
    return Tweet(json['id'], json['author'], json['message']);
  }

  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);

  Map<String, dynamic> toJson() => _$TweetToJson(this);

  @override
  String toString() {
    return 'Tweet{id: $id, author: $author, message: $message}';
  }
}