import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingsState {
  final bool isDarkMode;
  const SettingsState({this.isDarkMode = true});
  SettingsState copyWith({bool? isDarkMode}) => SettingsState(isDarkMode: isDarkMode ?? this.isDarkMode);
}

class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier() : super(const SettingsState());
  void toggleDarkMode() => state = state.copyWith(isDarkMode: !state.isDarkMode);
}

final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsState>((ref) => SettingsNotifier());

// Initialisation Supabase : faite dans main(), avant runApp (le routeur y accede au demarrage).
class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false);

  Future<void> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
    final account = await googleSignIn.signIn();
    if (account == null) return;
    final auth = await account.authentication;
    await Supabase.instance.client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: auth.idToken!,
      accessToken: auth.accessToken,
    );
    state = true;
  }

  Future<void> signOut() async {
    await Supabase.instance.client.auth.signOut();
    state = false;
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, bool>((ref) => AuthNotifier());
