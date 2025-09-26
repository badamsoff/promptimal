import 'package:flutter/material.dart';
import '../../theme/neon_theme_extension.dart';

class NeonToggle extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  const NeonToggle({super.key, required this.value, required this.onChanged});

  @override
  State<NeonToggle> createState() => _NeonToggleState();
}

class _NeonToggleState extends State<NeonToggle> with SingleTickerProviderStateMixin {
  late bool _value;
  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final neon = Theme.of(context).extension<NeonThemeExtension>()!;
    return GestureDetector(
      onTap: () {
        setState(() => _value = !_value);
        widget.onChanged(_value);
      },
      child: AnimatedContainer(
        duration: neon.mediumDuration,
        width: 56,
        height: 32,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: _value ? [neon.acidGreen, neon.electricCyan] : [Colors.grey.shade700, Colors.grey.shade800]),
          boxShadow: [
            BoxShadow(color: (_value ? neon.acidGreen : Colors.black).withOpacity(0.4), blurRadius: _value ? neon.glowRadius : 0),
          ],
        ),
        child: Align(
          alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
