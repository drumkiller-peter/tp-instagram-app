import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tp_instagram_app/screens/animation_screen/new_hero_screen.dart';
import 'package:tp_instagram_app/screens/animation_screen/stagger_animation_screen.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  double _height = 100;
  double _width = 100;

  Color _color = Colors.redAccent;
  String _text = "I am inside a container";
  double _opacity = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Screens"),
      ),
      body: AnimationLimiter(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _height,
                width: _width,
                padding: const EdgeInsets.all(8),
                color: _color,
                margin: const EdgeInsets.all(8),
                child: Text(_text),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StaggerAnimationScreen(),
                    ),
                  );
                },
                child: AnimatedContainer(
                  curve: Curves.elasticInOut,
                  duration: const Duration(seconds: 3),
                  height: _height,
                  width: _width,
                  padding: const EdgeInsets.all(8),
                  color: _color,
                  margin: const EdgeInsets.all(8),
                  child: Text(_text),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _height = 200;
                    _width = 600;
                    _color = Colors.yellowAccent;
                    _text = "I am after animation";
                    _opacity = 0.0;
                  });
                },
                child: const Text("Animate"),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HeroScreen(),
                    ),
                  );
                },
                child: Hero(
                  tag: "image",
                  child: Image.network(
                    "https://images.pexels.com/photos/3729464/pexels-photo-3729464.jpeg?cs=srgb&dl=pexels-mike-bird-3729464.jpg&fm=jpg",
                    width: 200,
                    height: 100,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AnimatedOpacity(
                curve: Curves.bounceInOut,
                opacity: _opacity,
                duration: const Duration(milliseconds: 3000),
                child: Image.network(
                  "https://images.pexels.com/photos/3729464/pexels-photo-3729464.jpeg?cs=srgb&dl=pexels-mike-bird-3729464.jpg&fm=jpg",
                  width: 200,
                  height: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
