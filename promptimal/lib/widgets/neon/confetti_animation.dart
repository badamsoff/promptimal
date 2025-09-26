import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ConfettiAnimation extends StatelessWidget {
  final double size;
  const ConfettiAnimation({super.key, this.size = 160});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Lottie.asset('assets/lottie/profile/achievement_unlock.json', fit: BoxFit.contain),
    );
  }
}
