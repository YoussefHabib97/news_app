class ArticleModel {
  final String? image;
  final String title;
  final String? subTitle;

  ArticleModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      image: json['image'],
      title: json['title'],
      subTitle: json['subTitle'],
    );
  }
}
