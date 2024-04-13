class Comment {
  late int postId;
  late int id;
  late String email;
  late String name;
  late String body;

  Comment(
      {required this.name,
      required this.id,
      required this.email,
      required this.postId,
      required this.body});

  Comment.parseJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    body = json['body'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['postId'] = postId;
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['body'] = body;
    return data;
  }
}
