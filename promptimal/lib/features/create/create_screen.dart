import 'package:flutter/material.dart';
import '../../services/gemini_service.dart';
import '../../widgets/neon/animated_glass_panel.dart';
import '../../widgets/neon/neon_text_field.dart';
import '../../widgets/neon/glow_button.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _controller = TextEditingController();
  final _service = GeminiService();
  bool _busy = false;
  String? _result;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _generate() async {
    if (_busy) return;
    final instruction = _controller.text.trim();
    if (instruction.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Decris d abord ton prompt.')));
      return;
    }
    setState(() {
      _busy = true;
      _result = null;
    });
    final result = await _service.generatePrompt(instruction);
    if (!mounted) return;
    setState(() {
      _busy = false;
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Créateur de prompts')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: AnimatedGlassPanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Instruction',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              NeonTextField(controller: _controller, hintText: 'Décris ton prompt...'),
              const SizedBox(height: 16),
              GlowButton(
                onPressed: _busy ? null : _generate,
                child: _busy
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                    : const Text('Générer'),
              ),
              if (_result != null) ...[
                const SizedBox(height: 16),
                const Text('Résultat',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                SelectableText(
                  _result!,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 8),
                Text(
                  'Note : service Gemini non encore branche, reponse de demonstration.',
                  style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
