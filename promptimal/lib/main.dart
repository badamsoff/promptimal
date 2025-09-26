import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'theme/neon_theme_extension.dart';
import 'theme/neon_colors.dart';
import 'features/auth/login_screen.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'features/library/library_screen.dart';
import 'features/create/create_screen.dart';
import 'features/profile/profile_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
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
    GoRoute(
      path: '/library',
      builder: (context, state) => const LibraryScreen(),
    ),
    GoRoute(
      path: '/create',
      builder: (context, state) => const CreateScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
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
