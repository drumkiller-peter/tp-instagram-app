import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HeroScreen extends StatelessWidget {
  const HeroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero Screens"),
      ),
      body: Column(
        children: [
          Hero(
            tag: "image",
            child: Image.network(
                "https://images.pexels.com/photos/3729464/pexels-photo-3729464.jpeg?cs=srgb&dl=pexels-mike-bird-3729464.jpg&fm=jpg"),
          ),
          Lottie.asset('assets/json/fire_animation.json'),
        ],
      ),
    );
  }
}
