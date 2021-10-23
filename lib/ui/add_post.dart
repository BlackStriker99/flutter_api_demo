import 'package:flutter/material.dart';
import 'package:untitled/helpers/api_helper.dart';
import 'package:untitled/models/post.dart';
import 'package:untitled/models/user.dart';

class AddPost extends StatefulWidget {
  User user;
  AddPost(this.user, {Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add post"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Map<String, dynamic> postData = {};

          postData["title"] = titleController.text;
          postData["body"] = bodyController.text;
          postData["userId"] = widget.user.id;

          Post post = await AuthHelper().addPost(postData);
          debugPrint("Post:- ${post.toJson()}");
          Navigator.pop(context, post);
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(hintText: "Enter Title"),
          ),
          TextFormField(
            controller: bodyController,
            decoration: InputDecoration(hintText: "Enter body"),
          ),
        ],
      ),
    );
  }
}
