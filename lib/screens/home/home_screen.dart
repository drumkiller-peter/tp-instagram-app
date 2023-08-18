// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
      ),
      body: Column(
        children: [
          Text("Welcome $email"),
        ],
      ),
    );
  }
}
