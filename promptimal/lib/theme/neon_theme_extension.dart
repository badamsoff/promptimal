import 'package:flutter/material.dart';
import 'neon_colors.dart';

class NeonThemeExtension extends ThemeExtension<NeonThemeExtension> {
  final Color electricViolet;
  final Color electricCyan;
  final Color neonMagenta;
  final Color acidGreen;
  final Color neonBlue;
  final Color neonOrange;
  final Color neonPink;
  final Color neonYellow;
  final Color neonWhite;
  final Color neonRed;
  final Color neonPurple;
  final Color darkBackground;
  final Color darkSurface;

  // Animation durations
  final Duration fastDuration;
  final Duration mediumDuration;
  final Duration slowDuration;
  final Duration ultraSlowDuration;

  // Glow / radius
  final double glowRadius;
  final double glowRadiusIntense;
  final double borderRadius;
  final double borderRadiusLarge;

  const NeonThemeExtension({
    required this.electricViolet,
    required this.electricCyan,
    required this.neonMagenta,
    required this.acidGreen,
    required this.neonBlue,
    required this.neonOrange,
    required this.neonPink,
    required this.neonYellow,
    required this.neonWhite,
    required this.neonRed,
    required this.neonPurple,
    required this.darkBackground,
    required this.darkSurface,
    required this.fastDuration,
    required this.mediumDuration,
    required this.slowDuration,
    required this.ultraSlowDuration,
    required this.glowRadius,
    required this.glowRadiusIntense,
    required this.borderRadius,
    required this.borderRadiusLarge,
  });

  static const NeonThemeExtension defaultTheme = NeonThemeExtension(
    electricViolet: NeonColors.electricViolet,
    electricCyan: NeonColors.electricCyan,
    neonMagenta: NeonColors.neonMagenta,
    acidGreen: NeonColors.acidGreen,
    neonBlue: NeonColors.neonBlue,
    neonOrange: NeonColors.neonOrange,
    neonPink: NeonColors.neonPink,
    neonYellow: NeonColors.neonYellow,
    neonWhite: NeonColors.neonWhite,
    neonRed: NeonColors.neonRed,
    neonPurple: NeonColors.neonPurple,
    darkBackground: NeonColors.darkBackground,
    darkSurface: NeonColors.darkSurface,
    fastDuration: Duration(milliseconds: 150),
    mediumDuration: Duration(milliseconds: 300),
    slowDuration: Duration(milliseconds: 600),
    ultraSlowDuration: Duration(milliseconds: 1200),
    glowRadius: 8,
    glowRadiusIntense: 24,
    borderRadius: 16,
    borderRadiusLarge: 28,
  );

  @override
  ThemeExtension<NeonThemeExtension> copyWith({
    Color? electricViolet,
    Color? electricCyan,
    Color? neonMagenta,
    Color? acidGreen,
    Color? neonBlue,
    Color? neonOrange,
    Color? neonPink,
    Color? neonYellow,
    Color? neonWhite,
    Color? neonRed,
    Color? neonPurple,
    Color? darkBackground,
    Color? darkSurface,
    Duration? fastDuration,
    Duration? mediumDuration,
    Duration? slowDuration,
    Duration? ultraSlowDuration,
    double? glowRadius,
    double? glowRadiusIntense,
    double? borderRadius,
    double? borderRadiusLarge,
  }) {
    return NeonThemeExtension(
      electricViolet: electricViolet ?? this.electricViolet,
      electricCyan: electricCyan ?? this.electricCyan,
      neonMagenta: neonMagenta ?? this.neonMagenta,
      acidGreen: acidGreen ?? this.acidGreen,
      neonBlue: neonBlue ?? this.neonBlue,
      neonOrange: neonOrange ?? this.neonOrange,
      neonPink: neonPink ?? this.neonPink,
      neonYellow: neonYellow ?? this.neonYellow,
      neonWhite: neonWhite ?? this.neonWhite,
      neonRed: neonRed ?? this.neonRed,
      neonPurple: neonPurple ?? this.neonPurple,
      darkBackground: darkBackground ?? this.darkBackground,
      darkSurface: darkSurface ?? this.darkSurface,
      fastDuration: fastDuration ?? this.fastDuration,
      mediumDuration: mediumDuration ?? this.mediumDuration,
      slowDuration: slowDuration ?? this.slowDuration,
      ultraSlowDuration: ultraSlowDuration ?? this.ultraSlowDuration,
      glowRadius: glowRadius ?? this.glowRadius,
      glowRadiusIntense: glowRadiusIntense ?? this.glowRadiusIntense,
      borderRadius: borderRadius ?? this.borderRadius,
      borderRadiusLarge: borderRadiusLarge ?? this.borderRadiusLarge,
    );
  }

  @override
  ThemeExtension<NeonThemeExtension> lerp(ThemeExtension<NeonThemeExtension>? other, double t) {
    if (other is! NeonThemeExtension) return this;
    return NeonThemeExtension(
      electricViolet: Color.lerp(electricViolet, other.electricViolet, t) ?? electricViolet,
      electricCyan: Color.lerp(electricCyan, other.electricCyan, t) ?? electricCyan,
      neonMagenta: Color.lerp(neonMagenta, other.neonMagenta, t) ?? neonMagenta,
      acidGreen: Color.lerp(acidGreen, other.acidGreen, t) ?? acidGreen,
      neonBlue: Color.lerp(neonBlue, other.neonBlue, t) ?? neonBlue,
      neonOrange: Color.lerp(neonOrange, other.neonOrange, t) ?? neonOrange,
      neonPink: Color.lerp(neonPink, other.neonPink, t) ?? neonPink,
      neonYellow: Color.lerp(neonYellow, other.neonYellow, t) ?? neonYellow,
      neonWhite: Color.lerp(neonWhite, other.neonWhite, t) ?? neonWhite,
      neonRed: Color.lerp(neonRed, other.neonRed, t) ?? neonRed,
      neonPurple: Color.lerp(neonPurple, other.neonPurple, t) ?? neonPurple,
      darkBackground: Color.lerp(darkBackground, other.darkBackground, t) ?? darkBackground,
      darkSurface: Color.lerp(darkSurface, other.darkSurface, t) ?? darkSurface,
      fastDuration: Duration(milliseconds: lerpDouble(fastDuration.inMilliseconds.toDouble(), other.fastDuration.inMilliseconds.toDouble(), t)!.round()),
      mediumDuration: Duration(milliseconds: lerpDouble(mediumDuration.inMilliseconds.toDouble(), other.mediumDuration.inMilliseconds.toDouble(), t)!.round()),
      slowDuration: Duration(milliseconds: lerpDouble(slowDuration.inMilliseconds.toDouble(), other.slowDuration.inMilliseconds.toDouble(), t)!.round()),
      ultraSlowDuration: Duration(milliseconds: lerpDouble(ultraSlowDuration.inMilliseconds.toDouble(), other.ultraSlowDuration.inMilliseconds.toDouble(), t)!.round()),
      glowRadius: lerpDouble(glowRadius, other.glowRadius, t) ?? glowRadius,
      glowRadiusIntense: lerpDouble(glowRadiusIntense, other.glowRadiusIntense, t) ?? glowRadiusIntense,
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t) ?? borderRadius,
      borderRadiusLarge: lerpDouble(borderRadiusLarge, other.borderRadiusLarge, t) ?? borderRadiusLarge,
    );
  }
}

double? lerpDouble(double a, double b, double t) => a + (b - a) * t;
