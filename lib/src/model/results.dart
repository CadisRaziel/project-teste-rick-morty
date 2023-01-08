import 'dart:convert';

import 'package:rick_morty_api/src/model/location.dart';
import 'package:rick_morty_api/src/model/origin.dart';

class Results {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin origin;
  final Location location;
  final String image; 
  final List<String> episode;
  final String url;
  final String created;

  Results({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "name": name,
      "status": status,
      "species": species,
      "type": type,
      "gender": gender,
      "origin": origin.toMap(),
      "location": location.toMap(),
      "image": image,
      "episode": episode,
      "url": url,
      "created": created,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Results.fromMap(Map<String, dynamic> map) {
    return Results(
      id: map["id"] ?? 0,
      name: map["name"] ?? "",
      status: map["status"] ?? "",
      species: map["species"] ?? "",
      type: map["type"] ?? "não temos esse tipo",
      gender: map["gender"] ?? "",
      origin: Origin.fromMap(map["origin"] ?? <String, dynamic> {}),
      location: Location.fromMap(map["location"] ?? <String, dynamic>{}),
      image: map["image"] ?? "",
      episode: List<String>.from(map["episode"] ?? <String>[]),
      url: map["url"] ?? "",
      created: map["created"] ?? "",
    );
  }

  factory Results.fromJson(String json) => Results.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Results(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episode: $episode, url: $url, created: $created)';
  }
}
