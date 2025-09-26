import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchQueryNotifier extends StateNotifier<String> {
  SearchQueryNotifier() : super('');
  Timer? _timer;

  void setQueryDebounced(String q, {Duration delay = const Duration(milliseconds: 250)}) {
    _timer?.cancel();
    _timer = Timer(delay, () => state = q);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final searchQueryProvider = StateNotifierProvider<SearchQueryNotifier, String>((ref) => SearchQueryNotifier());
