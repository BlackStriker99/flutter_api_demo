import 'package:flutter/material.dart';
import 'package:untitled/models/user.dart';
import 'package:untitled/ui/album_list.dart';
import 'package:untitled/ui/post_list.dart';
import 'package:untitled/ui/todo_list.dart';

class UserDetail extends StatefulWidget {
  User? user;

  UserDetail(this.user, {Key? key}) : super(key: key);

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  PageController pageController = PageController();
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Detail"),
        bottom: TabBar(
          controller: tabController,
          onTap: (index) {
            currentIndex = index;
            pageController.animateToPage(index,
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn);
            setState(() {});
          },
          tabs: const [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Posts"),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Albums"),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Todos"),
            ),
          ],
        ),
      ),
      body: PageView(
        onPageChanged: (index) {
          tabController?.animateTo(index);
          currentIndex = index;
        },
        controller: pageController,
        children: [
          PostList(widget.user!),
          AlbumList(widget.user!),
          TodoList(widget.user!),
        ],
      ),
    );
  }
}
