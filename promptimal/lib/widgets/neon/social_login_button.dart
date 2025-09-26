import 'package:flutter/material.dart';
import '../../theme/neon_theme_extension.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  const SocialLoginButton({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    final neon = Theme.of(context).extension<NeonThemeExtension>()!;
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(neon.borderRadius),
          border: Border.all(color: neon.neonYellow.withOpacity(0.5)),
          boxShadow: [
            BoxShadow(color: neon.neonYellow.withOpacity(0.45), blurRadius: neon.glowRadius),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.login, color: Colors.white),
            const SizedBox(width: 12),
            Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
