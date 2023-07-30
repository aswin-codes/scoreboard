import 'package:flutter/material.dart';

class Undeveloped extends StatelessWidget {
  const Undeveloped({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Not Developed",
          style: TextStyle(
            color: Colors.red
          ),
        )
      )
    );
  }
}