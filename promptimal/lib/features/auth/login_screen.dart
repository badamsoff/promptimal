import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/settings_provider.dart';
import '../../widgets/neon/particle_background.dart';
import '../../widgets/neon/animated_glass_panel.dart';
import '../../widgets/neon/neon_text_field.dart';
import '../../widgets/neon/social_login_button.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          const ParticleBackground(particleCount: 140),
          Center(
            child: AnimatedGlassPanel(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Connexion', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 16),
                  const NeonTextField(hintText: 'Email'),
                  const SizedBox(height: 12),
                  const NeonTextField(hintText: 'Mot de passe', obscureText: true),
                  const SizedBox(height: 16),
                  SocialLoginButton(
                    onPressed: () => ref.read(authNotifierProvider.notifier).signInWithGoogle(),
                    label: 'Continuer avec Google',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
