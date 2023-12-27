import 'dart:convert';

List<Movie> movieFromJson(String str) =>
    List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

String movieToJson(List<Movie> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Movie {
  String title;
  int year;
  String duration;
  String gender;
  String country;
  String link;
  String img;
  String description;

  Movie({
    required this.title,
    required this.year,
    required this.duration,
    required this.gender,
    required this.country,
    required this.link,
    required this.img,
    required this.description,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        title: json["title"],
        year: json["year"],
        duration: json["duration"],
        gender: json["gender"],
        country: json["country"],
        link: json["link"],
        img: json["img"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "year": year,
        "duration": duration,
        "gender": gender,
        "country": country,
        "link": link,
        "img": img,
        "description": description,
      };
}
