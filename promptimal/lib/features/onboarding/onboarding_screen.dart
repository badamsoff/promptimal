import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/neon/particle_background.dart';
import '../../widgets/neon/animated_glass_panel.dart';
import '../../widgets/neon/glow_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ParticleBackground(particleCount: 120),
          Center(
            child: AnimatedGlassPanel(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Promptimal', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white)),
                  const SizedBox(height: 8),
                  Text('Plateforme néon pour créer et gérer des prompts', style: TextStyle(color: Colors.white.withOpacity(0.75))),
                  const SizedBox(height: 24),
                  GlowButton(onPressed: () => context.go('/login'), child: const Text('Commencer')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
