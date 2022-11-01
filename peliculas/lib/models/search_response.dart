import 'dart:convert';

import 'models.dart';

class SearchResponse {
  SearchResponse({
    required this.page,
    required this.totalResults,
    required this.totalPages,
    required this.results,
  });

  int page;
  int totalResults;
  int totalPages;
  List<Movie> results;

  factory SearchResponse.fromJson(String str) =>
      SearchResponse.fromMap(json.decode(str));

  factory SearchResponse.fromMap(Map<String, dynamic> json) => SearchResponse(
        page: json["page"],
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
      );
}
