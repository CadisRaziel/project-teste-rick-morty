// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class Origin {
  final String name;
  final String url;

  Origin({
    required this.name,
    required this.url,
  });


  Map<String, dynamic> toMap(){
    return {
      "name": name,
      "url": url,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Origin.fromMap(Map<String, dynamic> map) {
    return Origin(
      name: map["name"] ?? "",
      url: map["url"] ?? "",
    );
  }

  factory Origin.fromJson(String json) => Origin.fromMap(jsonDecode(json));

  @override
  String toString() => 'Origin(name: $name, url: $url)';
}
