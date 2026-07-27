final class Question {
  const Question({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.linkUrl,
    required this.order,
  });

  final int id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String linkUrl;
  final int order;
}
