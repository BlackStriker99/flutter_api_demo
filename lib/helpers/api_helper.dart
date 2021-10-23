import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/models/album.dart';
import 'package:untitled/models/photo.dart';
import 'package:untitled/models/post.dart';
import 'package:untitled/models/todo.dart';
import 'package:untitled/models/user.dart';

class AuthHelper {
  final String _baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<User>> getUserList() async {
    String finalUrl = _baseUrl + "/users";

    Uri url = Uri.parse(finalUrl);

    Response response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<User> users = [];

      data.forEach((element) {
        users.add(User.fromJson(element));
      });

      return users;
    }
    return Future.error("STATUS CODE:- ${response.statusCode}");
  }

  Future<List<Post>> getPostList(String id) async {
    String finalUrl = _baseUrl + "/posts?userId=$id";

    Uri url = Uri.parse(finalUrl);

    Response response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Post> posts = [];

      data.forEach((element) {
        posts.add(Post.fromJson(element));
      });

      return posts;
    }
    return Future.error("STATUS CODE:- ${response.statusCode}");
  }

  Future<Post> addPost(Map<String, dynamic> data) async {
    String finalUrl = _baseUrl + "/posts";

    Uri url = Uri.parse(finalUrl);

    Response response = await http.post(url, body: jsonEncode(data), headers: {
      'Content-type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 201) {
      Map data = jsonDecode(response.body);

      debugPrint("DATA:-- $data");

      Post post = Post.fromJson(data);

      return post;
    }
    return Future.error("STATUS CODE:- ${response.statusCode}");
  }

  Future<List<Album>> getAlbumList(String id) async {
    String finalUrl = _baseUrl + "/albums?userId=$id";

    Uri url = Uri.parse(finalUrl);

    Response response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Album> albums = [];

      data.forEach((element) {
        albums.add(Album.fromJson(element));
      });

      return albums;
    }
    return Future.error("STATUS CODE:- ${response.statusCode}");
  }

  Future<List<Todo>> getTodoList(String id) async {
    String finalUrl = _baseUrl + "/todos?userId=$id";

    Uri url = Uri.parse(finalUrl);

    Response response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Todo> todos = [];

      data.forEach((element) {
        todos.add(Todo.fromJson(element));
      });

      return todos;
    }
    return Future.error("STATUS CODE:- ${response.statusCode}");
  }

  Future<List<Photo>> getPhotoList(String id) async {
    String finalUrl = _baseUrl + "/photos?albumId=$id";

    Uri url = Uri.parse(finalUrl);

    Response response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Photo> todos = [];

      data.forEach((element) {
        todos.add(Photo.fromJson(element));
      });

      return todos;
    }
    return Future.error("STATUS CODE:- ${response.statusCode}");
  }
}
