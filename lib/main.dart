import 'package:flutter/material.dart';
import 'package:toonflix_2nd/screens/home_screen.dart';

void main() {
  runApp(const Toonflix());
}

class Toonflix extends StatelessWidget {
  const Toonflix({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
