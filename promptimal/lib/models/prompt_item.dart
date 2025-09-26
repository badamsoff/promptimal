class PromptItem {
  final String id;
  final String title;
  final String content;
  final List<String> tags;
  final DateTime createdAt;
  final bool favorite;

  const PromptItem({
    required this.id,
    required this.title,
    required this.content,
    required this.tags,
    required this.createdAt,
    this.favorite = false,
  });
}
