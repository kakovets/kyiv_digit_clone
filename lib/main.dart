import 'package:flutter/material.dart';
import 'package:kyiv_digit_clone/screens/some_request_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: Colors.white),
        useMaterial3: true,
      ),
      home: const SomeRequestScreen(),
    ),
  );
}