// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class Location {
  final String name;
  final String url;

  Location({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "url": url,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      name: map["name"] ?? "",
      url: map["url"] ?? "",
    );
  }


  factory Location.fromJson(String json) => Location.fromMap(jsonDecode(json));

  @override
  String toString() => 'Location(name: $name, url: $url)';
}
