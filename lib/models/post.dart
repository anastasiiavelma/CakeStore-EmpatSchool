class Post {
  late int userId;
  late int id;
  late String title;
  late String content;
  late String image;
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.content,
    required this.image,
  });

  Post.parseJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['image'] = image;
    return data;
  }
}
