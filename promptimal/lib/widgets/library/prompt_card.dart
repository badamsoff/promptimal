import 'dart:math';
import 'package:flutter/material.dart';
import '../../models/prompt_item.dart';
import '../../theme/neon_theme_extension.dart';

class PromptCard extends StatefulWidget {
  final PromptItem item;
  const PromptCard({super.key, required this.item});

  @override
  State<PromptCard> createState() => _PromptCardState();
}

class _PromptCardState extends State<PromptCard> {
  double _tiltX = 0;
  double _tiltY = 0;

  void _updateTilt(Offset localPos, Size size) {
    final dx = (localPos.dx / size.width) - 0.5;
    final dy = (localPos.dy / size.height) - 0.5;
    setState(() {
      _tiltX = dy * -8;
      _tiltY = dx * 8;
    });
  }

  @override
  Widget build(BuildContext context) {
    final neon = Theme.of(context).extension<NeonThemeExtension>()!;
    return LayoutBuilder(
      builder: (context, constraints) {
        return MouseRegion(
          onHover: (ev) => _updateTilt(ev.localPosition, constraints.biggest),
          onExit: (_) => setState(() {
            _tiltX = 0;
            _tiltY = 0;
          }),
          child: AnimatedContainer(
            duration: neon.mediumDuration,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(_tiltX * pi / 180)
              ..rotateY(_tiltY * pi / 180),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(colors: [neon.electricViolet.withOpacity(0.18), neon.electricCyan.withOpacity(0.12)]),
              border: Border.all(color: neon.electricViolet.withOpacity(0.35)),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.item.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                Text(widget.item.content, style: TextStyle(color: Colors.white.withOpacity(0.85))),
              ],
            ),
          ),
        );
      },
    );
  }
}
