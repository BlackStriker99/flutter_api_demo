import 'package:flutter/material.dart';
import 'package:untitled/helpers/api_helper.dart';
import 'package:untitled/models/album.dart';
import 'package:untitled/models/user.dart';

class AlbumList extends StatefulWidget {
  User user;
  AlbumList(this.user, {Key? key}) : super(key: key);
  @override
  _AlbumListState createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Album>>(
        future: AuthHelper().getAlbumList(widget.user.id.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) =>
                  getAlbumUIItem(snapshot.data![index]),
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

  Widget getAlbumUIItem(Album album) {
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
              Text(album.title ?? ""),
            ],
          ),
        ),
      ),
    );
  }
}
