import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../widgets/neon/particle_background.dart';
import '../../widgets/neon/animated_glass_panel.dart';
import '../../widgets/neon/neon_text_field.dart';
import '../../widgets/neon/glow_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  bool _busy = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_busy) return;
    if (_password.text.length < 6) {
      _notify('Mot de passe : 6 caracteres minimum.');
      return;
    }
    if (_password.text != _confirm.text) {
      _notify('Les deux mots de passe ne correspondent pas.');
      return;
    }
    setState(() => _busy = true);
    try {
      final res = await Supabase.instance.client.auth
          .signUp(email: _email.text.trim(), password: _password.text);
      if (!mounted) return;
      if (res.session != null) {
        context.go('/library');
      } else {
        _notify('Compte cree. Confirme ton email puis connecte-toi.');
        context.go('/login');
      }
    } on AuthException catch (e) {
      if (mounted) _notify(e.message);
    } catch (_) {
      if (mounted) _notify('Inscription impossible. Verifie la configuration Supabase.');
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
                    const Text('Creer un compte',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 16),
                    NeonTextField(
                        controller: _email,
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress),
                    const SizedBox(height: 12),
                    NeonTextField(controller: _password, hintText: 'Mot de passe', obscureText: true),
                    const SizedBox(height: 12),
                    NeonTextField(controller: _confirm, hintText: 'Confirmer le mot de passe', obscureText: true),
                    const SizedBox(height: 16),
                    GlowButton(
                      onPressed: _busy ? null : _submit,
                      child: _busy
                          ? const SizedBox(
                              height: 18,
                              width: 18,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                          : const Text('Creer le compte'),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () => context.go('/login'),
                      child: const Text('Deja un compte ? Se connecter',
                          style: TextStyle(color: Colors.white70)),
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
