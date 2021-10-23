import 'package:flutter/material.dart';
import 'package:untitled/helpers/api_helper.dart';
import 'package:untitled/models/post.dart';
import 'package:untitled/models/user.dart';
import 'package:untitled/ui/add_post.dart';

class PostList extends StatefulWidget {
  User user;
  PostList(this.user, {Key? key}) : super(key: key);
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  List<Post> postList = [];

  bool isFetching = false;

  Future<void> fetchData() async {
    isFetching = true;
    setState(() {});

    postList = await AuthHelper()
        .getPostList(widget.user!.id!.toString())
        .catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error While Fetching Users $error")));
    });

    isFetching = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddPost(widget.user)));

          if (result != null) {
            if (result is Post) {
              postList.add(result);
              setState(() {});
            }
          }
        },
        child: Icon(Icons.add),
      ),
      body: isFetching
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) => buildPostItem(postList[index]),
              itemCount: postList.length,
            ),
    );
  }

  Widget buildPostItem(Post post) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => const UserDetail()));
      },
      child: Card(
        color: Colors.white,
        elevation: 10,
        shadowColor: Colors.teal.shade50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.title ?? ""),
              Text(post.userId.toString() ?? ""),
            ],
          ),
          subtitle: Text(post.body ?? ""),
        ),
      ),
    );
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }
}
