/// userId : 1
/// id : 1
/// title : "delectus aut autem"
/// completed : false

class Todo {
  Todo({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  Todo.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }
  int? userId;
  int? id;
  String? title;
  bool? completed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['completed'] = completed;
    return map;
  }
}
