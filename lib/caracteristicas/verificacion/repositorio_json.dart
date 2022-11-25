import 'dart:convert';
import 'package:explosive_harry_potter/dominio/problemas.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

abstract class RepositorioJson {
  Future<Either<Problema, dynamic>> obtenerJsonPersonajes();
  Future<Either<Problema, dynamic>> obtenerJsonHechizos();
}

class RepositorioJsonReal extends RepositorioJson {
  @override
  Future<Either<Problema, dynamic>> obtenerJsonPersonajes() async {
    try {
      final respuestaJson = await http
          .get(Uri.parse('https://hp-api.onrender.com/api/characters'));
      String jsonPersonajes = respuestaJson.body;
      JsonDecoder decoder = const JsonDecoder();

      final jsonObject = decoder.convert(jsonPersonajes);
      return Right(jsonObject);
    } catch (error) {
      return Left(VersionIncorrectaJson());
    }
  }

  @override
  Future<Either<Problema, dynamic>> obtenerJsonHechizos() async {
    try {
      final respuestaJson =
          await http.get(Uri.parse('https://hp-api.onrender.com/api/spells'));
      String jsonHechizos = respuestaJson.body;
      JsonDecoder decoder = const JsonDecoder();

      final jsonObject = decoder.convert(jsonHechizos);
      return Right(jsonObject);
    } catch (error) {
      return Left(VersionIncorrectaJson());
    }
  }
}
