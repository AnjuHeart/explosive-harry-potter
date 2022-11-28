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
        String madera = "";
        String nucleo = "";
        String portador = "";
        num largo = 0.0;

        int largoMadera = personaje["wand"]["wood"].toString().trim().length;
        largoMadera > 0
            ? madera = personaje["wand"]["wood"].toString().trim()
            : null;
        int largoNucleo = personaje["wand"]["core"].toString().trim().length;
        largoNucleo > 0
            ? nucleo = personaje["wand"]["core"].toString().trim()
            : null;

        personaje["wand"]["length"] == null
            ? null
            : largo = personaje["wand"]["length"];
        portador = personaje["name"].toString();
        if (madera != "" || nucleo != "" || largo != 0.0) {
          setVaritas.add(Varita.constructor(
              madera: madera,
              nucleo: nucleo,
              portador: portador,
              largo: largo));
        }
      }
      return Right(setVaritas);
    } catch (e) {
      return Left(VersionIncorrectaJson());
    }
  }
}
