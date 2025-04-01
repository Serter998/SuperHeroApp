import 'package:superhero_app/data/model/superhero_detail_response.dart';

class SuperheroResponse {
  final String response;
  final List<SuperHeroDetailResponse> result;

  SuperheroResponse({required this.response, required this.result});

  factory SuperheroResponse.fromJson(Map<String, dynamic> json)
  {
    var list = json["results"] as List;
    List<SuperHeroDetailResponse> heroList = list.map((hero) => SuperHeroDetailResponse.fromJson(hero)).toList();
    return SuperheroResponse(response: json["response"], result: heroList);
  }
}