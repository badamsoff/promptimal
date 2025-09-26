import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../providers/examples_provider.dart';
import '../../providers/search_query_provider.dart';
import '../../widgets/neon/animated_search_bar.dart';
import '../../widgets/library/prompt_card.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examples = ref.watch(examplesProvider);
    final query = ref.watch(searchQueryProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bibliothèque'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: AnimatedSearchBar(onChanged: (q) => ref.read(searchQueryProvider.notifier).setQueryDebounced(q)),
          ),
        ),
      ),
      body: examples.when(
        data: (items) {
          final filtered = query.isEmpty
              ? items
              : items
                  .where((e) => e.title.toLowerCase().contains(query.toLowerCase()) || e.content.toLowerCase().contains(query.toLowerCase()))
                  .toList();
          return MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            padding: const EdgeInsets.all(16),
            itemCount: filtered.length,
            itemBuilder: (context, i) => PromptCard(item: filtered[i]),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur: $e')),
      ),
    );
  }
}
