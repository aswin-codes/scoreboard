class User {
  int id;
  String name;
  int points;
  int position;
  String imageURL;
  bool isVerified;
  bool isUp;
  User(
      {required this.id,
      required this.name,
      required this.points,
      required this.imageURL,
      required this.isVerified,
      required this.position,
      required this.isUp
      });
}
