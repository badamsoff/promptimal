import '../models/prompt_item.dart';

class FavoritesRepository {
  final Set<String> _ids = {};
  Future<void> toggleFavorite(PromptItem item) async {
    if (_ids.contains(item.id)) {
      _ids.remove(item.id);
    } else {
      _ids.add(item.id);
    }
  }

  bool isFavorite(String id) => _ids.contains(id);
}
