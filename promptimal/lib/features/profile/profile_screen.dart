import 'package:flutter/material.dart';
import '../../widgets/profile/settings_toggles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Paramètres', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 12),
            SettingsToggles(),
          ],
        ),
      ),
    );
  }
}
