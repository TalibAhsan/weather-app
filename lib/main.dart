
import 'package:flutter/material.dart';
import 'package:twoo_climate/screens/home_screen.dart';

void main() {
  runApp(Climate());
}

class Climate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
