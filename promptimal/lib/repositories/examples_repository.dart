import '../models/prompt_item.dart';

class ExamplesRepository {
  Future<List<PromptItem>> fetchExamples({int limit = 20}) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return List.generate(limit, (i) => _demo(i));
  }

  PromptItem _demo(int i) => PromptItem(
        id: 'ex_$i',
        title: 'Prompt Exemple $i',
        content: 'Explique le concept $i avec un style cyberpunk.',
        tags: const ['ai', 'creative'],
        createdAt: DateTime.now().subtract(Duration(minutes: i)),
      );
}
