import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/prompt_item.dart';
import '../repositories/examples_repository.dart';

final examplesRepositoryProvider = Provider<ExamplesRepository>((ref) => ExamplesRepository());

final examplesProvider = FutureProvider<List<PromptItem>>((ref) async {
  final repo = ref.watch(examplesRepositoryProvider);
  return repo.fetchExamples(limit: 24);
});
