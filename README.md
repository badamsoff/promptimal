# Promptimal

Bibliothèque de prompts IA sur mobile. Thème cyberpunk neon. Application Flutter.

## Features

- Onboarding (3 pages) avec redirection automatique selon la session
- Auth Supabase : email/mot de passe + Google Sign-In
- Bibliothèque de prompts : recherche, filtres, favoris
- Créateur de prompts (génération Gemini à venir)
- Profil avec paramètres

## Stack

Flutter, Riverpod, go_router, Supabase (auth), flutter_dotenv.

## Démarrage

```bash
cd promptimal
flutter pub get
cp .env.example .env   # remplir SUPABASE_URL et SUPABASE_ANON_KEY
flutter run
```

## Configuration

Les clés vivent dans `promptimal/.env` (jamais commité) :
- SUPABASE_URL
- SUPABASE_ANON_KEY
- GEMINI_API_KEY (optionnel, génération à venir)

Sans clés Supabase, l'app démarre en mode non connecté et redirige vers /login.

## Notes

- Table Supabase requis pour la persistance des prompts/favoris : pas encore en place (données de démo en mémoire pour l'instant).
- Service Gemini : placeholder, non branché.
