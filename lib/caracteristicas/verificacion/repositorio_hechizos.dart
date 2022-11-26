import 'package:explosive_harry_potter/dominio/problemas.dart';
import 'package:explosive_harry_potter/dominio/registro_hechizos.dart';
import 'package:fpdart/fpdart.dart';

abstract class RepositorioHechizos {
  Either<Problema, Set<Hechizo>> obtenerHechizos(dynamic jsonHechizos);
}

class RepositorioHechizosReal extends RepositorioHechizos {
  @override
  Either<Problema, Set<Hechizo>> obtenerHechizos(dynamic jsonHechizos) {
    try {
      Set<Hechizo> setHechizos = {};
      for (var hechizo in jsonHechizos) {
        setHechizos.add(Hechizo.constructor(jsonElement: hechizo));
      }
      return Right(setHechizos);
    } catch (e) {
      return Left(VersionIncorrectaJson());
    }
  }
}
