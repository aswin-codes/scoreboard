import 'package:flutter/material.dart';

import '../Modals/Achievements.dart';

final List<Achievement> initialData = [
  Achievement(
      type: "Only Once", title: "Joined PayNav", subtitle: null, points: 50),
  Achievement(
      type: "Only Once", title: "First Purchase", subtitle: null, points: 250),
  Achievement(type: "Only Once", title: "KYC", subtitle: null, points: 50),
  Achievement(
      type: "Only Once",
      title: "Account Opened & Added Money",
      subtitle: null,
      points: 50),
  Achievement(
      type: "Only Once",
      title: "First Gold Purchase",
      subtitle: null,
      points: 50),
  Achievement(
      type: "Only Once",
      title: "First Voucher Purchase",
      subtitle: null,
      points: 50),
  Achievement(
      type: "Only Once",
      title: "First Direct Shopping",
      subtitle: null,
      points: 50),
  Achievement(
      type: "Only Once",
      title: "Play “The legend of Gold, Car & the Jet” ",
      subtitle: null,
      points: 50),
  Achievement(
      type: "Only Once",
      title: "Add Money in Account through Bank Transfer",
      subtitle: "( Valid only once )",
      points: 50),
  Achievement(
      type: "Only Once",
      title: "First Neo Card Transaction",
      subtitle: "( Coming Soon* )",
      points: 50),
  Achievement(
      type: "Only Once",
      title: "Neo Card First Offline Transaction",
      subtitle: "( Coming Soon* )",
      points: 50),
  Achievement(
      type: "My Network",
      title: "Refer a Friend",
      subtitle: "( After first successful transaction )",
      points: 10),
  Achievement(
      type: "My Network",
      title: "Refer a friend- on every 5th referral",
      subtitle: "( Like 10th referral, 15th, 20th and so on... )",
      points: 20),
  Achievement(
      type: "Once a Day",
      title: "Highest Gold Purchase of the day ",
      subtitle: " ( The amount should be highest of all buyers ) ",
      points: 100),
  Achievement(
      type: "Once a Day",
      title: "Highest Voucher Purchase of the day",
      subtitle: " ( The amount should be highest of all buyers )",
      points: 150),
  Achievement(
      type: "Once a Day",
      title: "Highest Money added in Account for the day",
      subtitle: " ( The amount should be highest of all the account holders )",
      points: 100),
  Achievement(
      type: "Unlimited",
      title: "Every Time Gold Purchased",
      subtitle: " ( 1 points on ₹20 spent, for ₹40 spent 2 points and so on )",
      points: 1),
  Achievement(
      type: "Unlimited",
      title: "Every Time Voucher Purchased",
      subtitle:
          " ( 10 points on ₹50 rupees spent, for ₹100 spent 20 points and so on )",
      points: 10),
  Achievement(
      type: "Unlimited",
      title: "Every Time Money added to Account",
      subtitle:
          " ( 10 points on ₹50 rupees spent, for ₹100 spent 20 points and so on )",
      points: 1),
  Achievement(
      type: "Unlimited",
      title: "Every Time Direct Shopping",
      subtitle: null,
      points: 10),
  Achievement(
      type: "Unlimited",
      title: "Every online transaction made with Neo Card",
      subtitle: " ( Coming Soon* )",
      points: 20),
  Achievement(
      type: "Unlimited",
      title: "Every offline transaction made with Neo Card",
      subtitle: " ( Coming Soon* )",
      points: 30),
  Achievement(
      type: "Growth Challenges",
      title: "7 days Gold Challenge ",
      subtitle: " ( 7 days continuous )",
      points: 50),
  Achievement(
      type: "Growth Challenges",
      title: "7 days Voucher Challenge",
      subtitle: " ( 7 days continuous )",
      points: 150),
  Achievement(
      type: "Growth Challenges",
      title: "7 days Neo Card Challenge ",
      subtitle: " ( Coming Soon*,7 days continuous ) ",
      points: 100),
  Achievement(
      type: "Growth Challenges",
      title: "30 days Gold Challenge ",
      subtitle: " ( Min amount ₹10, 30 days continuous )",
      points: 150),
  Achievement(
      type: "Growth Challenges",
      title: "30 days Vouchers Challenge ",
      subtitle: " ( 30 days continuous )",
      points: 500),
  Achievement(
      type: "Growth Challenges",
      title: "30 days Neo Card Challenge ",
      subtitle: " ( Coming Soon*, 30 days continuous )",
      points: 200),
];

class AchievementProvider with ChangeNotifier {
  final List<Achievement> _achievementList = initialData;
  List<Achievement> get achievementList => _achievementList;
  List<Achievement> get onlyOnce =>
      _achievementList.where((element) => element.type == "Only Once").toList();
  List<Achievement> get myNetwork =>
      _achievementList.where((element) => element.type == "My Network").toList();
  List<Achievement> get onceaDay =>
      _achievementList.where((element) => element.type == "Once a Day").toList();
  List<Achievement> get unlimited =>
      _achievementList.where((element) => element.type == "Unlimited").toList();
}
