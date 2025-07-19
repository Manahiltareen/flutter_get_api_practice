class BannerModel {
  final int id;
  final String imageUrl;
  final String title;
  final String description;

  BannerModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      imageUrl: json['imageUrl'],
      title: json['title'],
      description: json['description'],
    );
  }
}
