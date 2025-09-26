import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/neon/particle_background.dart';
import '../../widgets/neon/animated_glass_panel.dart';
import '../../widgets/neon/glow_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      _OnbPage(title: 'Crée des prompts', subtitle: 'Interface immersive et néon'),
      _OnbPage(title: 'Construit et teste', subtitle: 'Ajuste avec des sliders avancés'),
      _OnbPage(title: 'Sauvegarde & organise', subtitle: 'Bibliothèque puissante'),
    ];
    return Scaffold(
      body: Stack(
        children: [
          const ParticleBackground(particleCount: 120),
          PageView.builder(
            itemCount: pages.length,
            controller: PageController(),
            itemBuilder: (context, i) => Center(
              child: AnimatedGlassPanel(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Promptimal', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white.withOpacity(0.95))),
                    const SizedBox(height: 8),
                    Text(pages[i].title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 6),
                    Text(pages[i].subtitle, style: TextStyle(color: Colors.white.withOpacity(0.75))),
                    const SizedBox(height: 24),
                    GlowButton(onPressed: () => i == pages.length - 1 ? context.go('/login') : context.go('/login'), child: Text(i == pages.length - 1 ? 'Commencer' : 'Suivant')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OnbPage {
  final String title;
  final String subtitle;
  _OnbPage({required this.title, required this.subtitle});
}
