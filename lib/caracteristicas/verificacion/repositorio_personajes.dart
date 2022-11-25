import 'package:explosive_harry_potter/dominio/problemas.dart';
import 'package:explosive_harry_potter/dominio/registro_personajes.dart';
import 'package:explosive_harry_potter/dominio/registro_varitas.dart';
import 'package:fpdart/fpdart.dart';

abstract class RepositorioPersonajes {
  Either<Problema, Set<Personaje>> obtenerPersonajes(dynamic jsonPersonajes);
  Either<Problema, Set<Varita>> obtenerVaritas(dynamic jsonPersonajes);
}

class RepositorioPersonajesReal extends RepositorioPersonajes {
  @override
  Either<Problema, Set<Personaje>> obtenerPersonajes(dynamic jsonPersonajes) {
    try {
      Set<Personaje> setPersonajes = {};
      for (var personaje in jsonPersonajes) {
        setPersonajes.add(Personaje.constructor(jsonElement: personaje));
      }
      return Right(setPersonajes);
    } catch (e) {
      return Left(VersionIncorrectaJson());
    }
  }

  @override
  Either<Problema, Set<Varita>> obtenerVaritas(dynamic jsonPersonajes) {
    try {
      Set<Varita> setVaritas = {};
      for (var personaje in jsonPersonajes) {
        if (personaje["wand"]["wood"] != "") {
          setVaritas.add(Varita.constructor(jsonElement: personaje));
        }
      }
      return Right(setVaritas);
    } catch (e) {
      return Left(VersionIncorrectaJson());
    }
  }
}
