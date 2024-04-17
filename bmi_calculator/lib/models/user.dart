enum Gender { male, female }

class User {
  Gender gender;
  int height;
  int weight;
  int age;
  double bmi;
  String category;
  User({
    required this.age,
    required this.height,
    required this.weight,
    required this.gender,
    required this.bmi,
    required this.category,
  });
}
