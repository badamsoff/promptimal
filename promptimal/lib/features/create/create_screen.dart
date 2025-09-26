import 'package:flutter/material.dart';
import '../../widgets/neon/animated_glass_panel.dart';
import '../../widgets/neon/neon_text_field.dart';
import '../../widgets/neon/glow_button.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Créateur de prompts')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: AnimatedGlassPanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Instruction', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              NeonTextField(controller: controller, hintText: 'Décris ton prompt...'),
              const SizedBox(height: 16),
              GlowButton(onPressed: () {}, child: const Text('Générer')),
            ],
          ),
        ),
      ),
    );
  }
}
