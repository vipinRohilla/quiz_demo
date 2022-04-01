class User{
  String description;

  User({required this.description});

  Map<String, dynamic> toJson() => {
    'description' : description
  };
}