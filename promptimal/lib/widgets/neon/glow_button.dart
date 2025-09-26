import 'package:flutter/material.dart';
import '../../theme/neon_theme_extension.dart';

class GlowButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool intense;
  final EdgeInsetsGeometry padding;
  final double? width;

  const GlowButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.intense = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final neon = Theme.of(context).extension<NeonThemeExtension>()!;
    final radius = BorderRadius.circular(neon.borderRadius);
    final glow = intense ? neon.glowRadiusIntense : neon.glowRadius;
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: [
          BoxShadow(
            color: neon.electricCyan.withOpacity(0.6),
            blurRadius: glow,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: neon.electricViolet.withOpacity(0.6),
            blurRadius: glow,
            spreadRadius: 1,
          ),
        ],
        gradient: LinearGradient(
          colors: [neon.electricViolet, neon.electricCyan],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: radius,
          onTap: onPressed,
          child: Padding(
            padding: padding,
            child: DefaultTextStyle.merge(
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
              child: Center(child: child),
            ),
          ),
        ),
      ),
    );
  }
}
