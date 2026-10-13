import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static bool initialized = false;

  static Future<void> init({required String url, required String anonKey}) async {
    await Supabase.initialize(url: url, anonKey: anonKey);
    initialized = true;
  }

  static SupabaseClient get client => Supabase.instance.client;
}
