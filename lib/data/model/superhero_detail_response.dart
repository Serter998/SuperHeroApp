class SuperHeroDetailResponse {
  final String id;
  final String name;
  final String url;

  SuperHeroDetailResponse({
    required this.id,
    required this.name,
    required this.url,
  });

  factory SuperHeroDetailResponse.fromJson(Map<String, dynamic> json) {
    return SuperHeroDetailResponse(
      id: json["id"],
      name: json["name"],
      url: json["image"]["url"],
    );
  }
}
