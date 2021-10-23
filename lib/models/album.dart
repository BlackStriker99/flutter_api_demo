/// userId : 1
/// id : 1
/// title : "quidem molestiae enim"

class Album {
  Album({
    this.userId,
    this.id,
    this.title,
  });

  Album.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }
  int? userId;
  int? id;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    return map;
  }
}
