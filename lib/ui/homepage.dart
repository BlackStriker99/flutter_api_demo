import 'package:flutter/material.dart';
import 'package:untitled/helpers/api_helper.dart';
import 'package:untitled/models/user.dart';
import 'package:untitled/ui/user_detail.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> userList = [];
  bool isFetching = false;

  @override
  void initState() {
    // fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    isFetching = true;
    setState(() {});

    userList = await AuthHelper().getUserList().catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error While Fetching Users $error")));
    });

    isFetching = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Home Page"),
      ),
      // body: isFetching
      //     ? const Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     : ListView.builder(
      //         itemBuilder: (context, index) =>
      //             buildUserCardItem(userList[index]),
      //         itemCount: userList.length,
      //       ),
      body: FutureBuilder<List<User>>(
        future: AuthHelper().getUserList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) =>
                  buildUserCardItem(snapshot.data![index]),
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

  Widget buildUserCardItem(User user) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => UserDetail(user)));
      },
      child: Card(
        color: Colors.white,
        elevation: 10,
        shadowColor: Colors.teal.shade50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(child: Text("Name")),
                  Expanded(child: Text(user.name ?? "")),
                ],
              ),
              Row(
                children: [
                  const Expanded(child: Text("userName")),
                  Expanded(child: Text(user.username ?? "")),
                ],
              ),
              Row(
                children: [
                  const Expanded(child: Text("Email")),
                  Expanded(child: Text(user.email ?? "")),
                ],
              ),
              Row(
                children: [
                  const Expanded(child: Text("Phone")),
                  Expanded(child: Text(user.phone ?? "")),
                ],
              ),
              Row(
                children: [
                  const Expanded(child: Text("Address")),
                  Expanded(
                      child: Text(
                          "${user.address!.street ?? ""},  ${user.address!.suite ?? ""}, ${user.address!.city}" ??
                              "")),
                ],
              ),
              Row(
                children: [
                  const Expanded(child: Text("Website")),
                  Expanded(child: Text(user.website ?? "")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
