import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../providers/settings_provider.dart';
import '../../widgets/neon/particle_background.dart';
import '../../widgets/neon/animated_glass_panel.dart';
import '../../widgets/neon/neon_text_field.dart';
import '../../widgets/neon/glow_button.dart';
import '../../widgets/neon/social_login_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _busy = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await Supabase.instance.client.auth
          .signInWithPassword(email: _email.text.trim(), password: _password.text);
      if (mounted) context.go('/library');
    } on AuthException catch (e) {
      if (mounted) _notify(e.message);
    } catch (_) {
      if (mounted) _notify('Connexion impossible. Verifie la configuration Supabase.');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _notify(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ParticleBackground(particleCount: 140),
          Center(
            child: SingleChildScrollView(
              child: AnimatedGlassPanel(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Connexion',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 16),
                    NeonTextField(
                        controller: _email,
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress),
                    const SizedBox(height: 12),
                    NeonTextField(controller: _password, hintText: 'Mot de passe', obscureText: true),
                    const SizedBox(height: 16),
                    GlowButton(
                      onPressed: _busy ? null : _submit,
                      child: _busy
                          ? const SizedBox(
                              height: 18,
                              width: 18,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                          : const Text('Se connecter'),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () => context.go('/signup'),
                      child: const Text('Pas de compte ? Creer un compte',
                          style: TextStyle(color: Colors.white70)),
                    ),
                    const SizedBox(height: 6),
                    SocialLoginButton(
                      onPressed: () => ref.read(authNotifierProvider.notifier).signInWithGoogle(),
                      label: 'Continuer avec Google',
                    ),
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
