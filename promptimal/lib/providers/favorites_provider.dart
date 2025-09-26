import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/favorites_repository.dart';

final favoritesRepositoryProvider = Provider<FavoritesRepository>((ref) => FavoritesRepository());

final favoritesIdsProvider = StateProvider<Set<String>>((ref) => {});

final toggleFavoriteProvider = Provider<Future<void> Function(String)>((ref) {
  final ids = ref.read(favoritesIdsProvider);
  return (String id) async {
    if (ids.contains(id)) {
      ids.remove(id);
    } else {
      ids.add(id);
    }
    ref.read(favoritesIdsProvider.notifier).state = {...ids};
  };
});
