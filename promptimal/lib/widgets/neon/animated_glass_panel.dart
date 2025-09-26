import 'dart:ui';
import 'package:flutter/material.dart';
import '../../theme/neon_theme_extension.dart';

class AnimatedGlassPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  const AnimatedGlassPanel({super.key, required this.child, this.padding = const EdgeInsets.all(16)});

  @override
  Widget build(BuildContext context) {
    final neon = Theme.of(context).extension<NeonThemeExtension>()!;
    return ClipRRect(
      borderRadius: BorderRadius.circular(neon.borderRadiusLarge),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            border: Border.all(color: neon.neonPink.withOpacity(0.3), width: 1),
            gradient: LinearGradient(colors: [Colors.white.withOpacity(0.08), Colors.white.withOpacity(0.02)], begin: Alignment.topLeft, end: Alignment.bottomRight),
            boxShadow: [
              BoxShadow(color: neon.electricViolet.withOpacity(0.35), blurRadius: neon.glowRadius, spreadRadius: 1),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
