import 'dart:async';
import 'package:flutter/material.dart';
import '../core/utils.dart';
import 'main_screen.dart';

class SomeRequestScreen extends StatefulWidget {
  const SomeRequestScreen({super.key});

  @override
  State<SomeRequestScreen> createState() => _SomeRequestScreenState();
}

class _SomeRequestScreenState extends State<SomeRequestScreen> {

  @override
  void initState() {
    super.initState();
    _request();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      ),
    );
  }

  void _request() {
    formList();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const MainScreen(),
          transitionDuration: const Duration(milliseconds: 0),
        ),
      );
    });
  }
}