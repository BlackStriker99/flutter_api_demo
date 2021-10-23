import 'package:flutter/material.dart';

/// userId : 1
/// id : 1
/// title : "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
/// body : "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"

class Post {
  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  Post.fromJson(dynamic json) {
    debugPrint("userid is String:- ${json['userId'] is String}");
    debugPrint("title is String:- ${json['title'] is String}");
    debugPrint("body is String:- ${json['body'] is String}");
    debugPrint("id is String:- ${json['id'] is String}");

    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
  int? userId;
  int? id;
  String? title;
  String? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    return map;
  }
}
