import 'package:flutter/material.dart';
import '../../theme/neon_theme_extension.dart';

class AnimatedSearchBar extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const AnimatedSearchBar({super.key, required this.onChanged});

  @override
  State<AnimatedSearchBar> createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _expanded = true;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final neon = Theme.of(context).extension<NeonThemeExtension>()!;
    return Row(
      children: [
        Expanded(
          child: AnimatedContainer(
            duration: neon.mediumDuration,
            curve: Curves.easeOutCubic,
            height: 46,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: BorderRadius.circular(neon.borderRadius),
              border: Border.all(color: neon.neonBlue.withOpacity(0.4)),
              boxShadow: [
                BoxShadow(color: neon.neonBlue.withOpacity(0.35), blurRadius: neon.glowRadius),
              ],
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.white70),
                const SizedBox(width: 8),
                if (_expanded)
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onChanged: widget.onChanged,
                      decoration: const InputDecoration.collapsed(hintText: 'Rechercher des prompts...'),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () => setState(() => _expanded = !_expanded),
          icon: Icon(_expanded ? Icons.close_fullscreen : Icons.open_in_full, color: Colors.white70),
        )
      ],
    );
  }
}
