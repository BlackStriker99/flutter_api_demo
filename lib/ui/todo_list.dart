import 'package:flutter/material.dart';
import 'package:untitled/helpers/api_helper.dart';
import 'package:untitled/models/todo.dart';
import 'package:untitled/models/user.dart';

class TodoList extends StatefulWidget {
  User user;
  TodoList(this.user, {Key? key}) : super(key: key);
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Todo>>(
        future: AuthHelper().getTodoList(widget.user.id.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) =>
                  getTodoUIItem(snapshot.data![index]),
              itemCount: snapshot.data!.length,
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget getTodoUIItem(Todo todo) {
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
              Text(todo.title ?? ""),
              Text(todo.completed.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
