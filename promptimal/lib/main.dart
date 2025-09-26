import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'theme/neon_theme_extension.dart';
import 'theme/neon_colors.dart';
import 'features/auth/login_screen.dart';
import 'features/onboarding/onboarding_screen.dart';

void main() {
  runApp(const ProviderScope(child: PromptimalApp()));
}

final _router = GoRouter(
  initialLocation: '/onboarding',
  routes: <RouteBase>[
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);

class PromptimalApp extends StatelessWidget {
  const PromptimalApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: NeonColors.darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: NeonColors.electricViolet,
        secondary: NeonColors.electricCyan,
        surface: NeonColors.darkSurface,
      ),
      textTheme: Typography.whiteMountainView,
      useMaterial3: true,
      extensions: const <ThemeExtension<dynamic>>[
        NeonThemeExtension.defaultTheme,
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Promptimal',
      theme: theme,
      routerConfig: _router,
    );
  }
}
