import 'package:flutter/material.dart';
import 'package:TeleForge/features/home/screens/home_screen.dart';
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Directionality(
      textDirection: TextDirection.rtl,
      child: Home(),
    ),
    )
  );
}