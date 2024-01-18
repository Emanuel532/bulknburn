class User {
  String full_name;
  String email;
  String sex;
  int height;
  int age;
  DateTime birthday;
  //int gained_calories;

  User({
    required this.sex,
    required this.height,
    this.email = "",
    required this.full_name,
    required this.age,
    required this.birthday,
  });
}
