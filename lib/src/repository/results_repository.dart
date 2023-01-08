
import 'package:dio/dio.dart';
import 'package:rick_morty_api/src/model/results.dart';

class ResultsRepository {
  Future<List<Results>> findAllResults() async {
    try {
      final results = await Dio().get("https://rickandmortyapi.com/api/character");

      return results.data.map<Results>((results) {
        return Results.fromMap(results);
      }).toList();
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }
}