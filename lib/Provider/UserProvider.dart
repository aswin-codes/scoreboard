import 'package:flutter/material.dart';

import '../Modals/User.dart';

final List<User> initialData = [
  User(
      id: 1,
      name: "Raja reddy",
      points: 8370,
      imageURL: "assets/images/profile1.png",
      isVerified: true,
      isUp: true,
      position: 1),
  User(
      id: 2,
      name: "Natasha chowdary",
      points: 7260,
      imageURL: "assets/images/profile2.png",
      isVerified: false,
      isUp: true,
      position: 2),
  User(
      isUp: false,
      id: 3,
      name: "Samvibhan singh",
      points: 7260,
      imageURL: "assets/images/profile3.png",
      isVerified: false,
      position: 3),
  User(
      isUp: false,
      id: 4,
      name: "Shakilesh Yadav",
      points: 5960,
      imageURL: "assets/images/profile4.png",
      isVerified: false,
      position: 4),
  User(
      isUp: true,
      id: 5,
      name: "Kaveri Sharma",
      points: 5420,
      imageURL: "assets/images/profile5.png",
      isVerified: false,
      position: 5),
  User(
      isUp: true,
      id: 6,
      name: "Brij mahapatra",
      points: 5260,
      imageURL: "assets/images/profile7.png",
      isVerified: false,
      position: 6),
  User(
      isUp: false,
      id: 7,
      name: "Shikha rawat",
      points: 5190,
      imageURL: "assets/images/profile7.png",
      isVerified: true,
      position: 7),
  User(
      isUp: true,
      id: 8,
      name: "Natasha oberoi",
      points: 5010,
      imageURL: "assets/images/profile8.png",
      isVerified: true,
      position: 8),
  User(
      isUp: true,
      id: 9,
      name: "Danish sait",
      points: 4960,
      imageURL: "assets/images/profile9.png",
      isVerified: false,
      position: 9),
  User(
      isUp: false,
      id: 10,
      name: "Suraj agarwal",
      points: 4720,
      imageURL: "assets/images/profile10.png",
      isVerified: false,
      position: 10),
  User(
      isUp: false,
      id: 11,
      name: "Lalit Thakre",
      points: 2130,
      imageURL: "assets/images/profile11.png",
      isVerified: false,
      position: 41),
];

class UserProvider with ChangeNotifier {
  List<User> _users = initialData;
  List<User> get users => _users;

  User getUserById(int id) {
    return users.where((element) => element.id == id).toList()[0];
  }

  User getUserByPosition(int position) {
    return users.where((element) => element.position == position).toList()[0];
  }
}
