import 'package:bonfire_defense/game.dart';
import 'package:flutter/material.dart';

class BonfireDefense extends StatelessWidget {
  const BonfireDefense({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Game(),
    );
  }
}
