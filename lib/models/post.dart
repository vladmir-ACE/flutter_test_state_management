class Post {
  String title ;
  String description;

  Post({required this.title, required this.description});

  Post copyWith({String? title, String? description}) {
    return Post(title: title ?? this.title, description: description ?? this.description);
  }

  Map<String, String> format_to_json() {
    return {
      "title": title,
      "description": description,
    };
  }


}