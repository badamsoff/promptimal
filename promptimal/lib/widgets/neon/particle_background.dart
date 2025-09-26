import 'dart:math';
import 'package:flutter/material.dart';
import '../../theme/neon_theme_extension.dart';

class ParticleBackground extends StatefulWidget {
  final int particleCount;
  const ParticleBackground({super.key, this.particleCount = 80});

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<_Particle> _particles;
  final Random _rand = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();
    _particles = List.generate(widget.particleCount, (_) => _randomParticle());
  }

  _Particle _randomParticle() {
    return _Particle(
      position: Offset(_rand.nextDouble(), _rand.nextDouble()),
      velocity: Offset((_rand.nextDouble() - 0.5) * 0.002, (_rand.nextDouble() - 0.5) * 0.002),
      size: 1.0 + _rand.nextDouble() * 2,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final neon = Theme.of(context).extension<NeonThemeExtension>()!;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return CustomPaint(
          painter: _ParticlePainter(_particles, neon),
          child: const SizedBox.expand(),
        );
      },
    );
  }
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  final NeonThemeExtension neon;
  _ParticlePainter(this.particles, this.neon);

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      p.step(size);
      final offset = Offset(p.position.dx * size.width, p.position.dy * size.height);
      final paint = Paint()
        ..color = neon.electricCyan.withOpacity(0.6)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);
      canvas.drawCircle(offset, p.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _Particle {
  Offset position;
  Offset velocity;
  double size;
  _Particle({required this.position, required this.velocity, required this.size});

  void step(Size size) {
    position += velocity;
    if (position.dx < 0 || position.dx > 1) velocity = Offset(-velocity.dx, velocity.dy);
    if (position.dy < 0 || position.dy > 1) velocity = Offset(velocity.dx, -velocity.dy);
  }
}
