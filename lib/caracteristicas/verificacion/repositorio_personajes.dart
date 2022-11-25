import 'package:explosive_harry_potter/dominio/problemas.dart';
import 'package:explosive_harry_potter/dominio/registro_personajes.dart';
import 'package:fpdart/fpdart.dart';

abstract class RepositorioPersonajes {
  Either<Problema, Set<Personaje>> obtenerPersonajes(dynamic jsonPersonajes);
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
}
