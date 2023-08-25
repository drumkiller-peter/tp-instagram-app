import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class StaggerAnimationScreen extends StatelessWidget {
  const StaggerAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero Screens"),
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    height: 20,
                    width: 400,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
