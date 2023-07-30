import 'package:flutter/material.dart';

import '../Modals/Prize.dart';

final List<Prize> initialData = [
  Prize(
      iconUrl: "assets/icons/crown.png",
      position: "1",
      prizeIconUrl: "assets/icons/goldcoin.png",
      prizeType: "Gold",
      prizeAmount: "₹ 1,00,000"),
  Prize(
      iconUrl: "assets/icons/prize2.png",
      position: "2",
      prizeIconUrl: "assets/icons/goldcoin.png",
      prizeType: "Gold",
      prizeAmount: "₹ 50,000"),
  Prize(
      iconUrl: "assets/icons/prize3.png",
      position: "3",
      prizeIconUrl: "assets/icons/amazon.png",
      prizeType: "Voucher",
      prizeAmount: "₹ 10,000"),
  Prize(
      iconUrl: "assets/icons/prize4.png",
      position: "4 - 10",
      prizeIconUrl: "assets/icons/swiggy.png",
      prizeType: "Voucher",
      prizeAmount: "₹ 1,000"),
  Prize(
      iconUrl: "assets/icons/prize5.png",
      position: "11 - 100",
      prizeIconUrl: "assets/icons/goldcoin.png",
      prizeType: "Gold",
      prizeAmount: "10 mg"),
  Prize(
      iconUrl: "assets/icons/prize6.png",
      position: "101 - 500",
      prizeIconUrl: "assets/icons/goldcoin.png",
      prizeType: "Gold",
      prizeAmount: "1 mg"),
];

class PrizeProvider with ChangeNotifier {
  final List<Prize> _prizeList = initialData;
  List<Prize> get prizeList => _prizeList;  
}
