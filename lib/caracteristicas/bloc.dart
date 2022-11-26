// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:explosive_harry_potter/caracteristicas/verificacion/repositorio_hechizos.dart';
import 'package:explosive_harry_potter/caracteristicas/verificacion/repositorio_personajes.dart';
import 'package:explosive_harry_potter/dominio/registro_hechizos.dart';
import 'package:explosive_harry_potter/dominio/registro_varitas.dart';
import 'package:fpdart/fpdart.dart';

import 'package:explosive_harry_potter/caracteristicas/verificacion/repositorio_json.dart';
import 'package:explosive_harry_potter/dominio/problemas.dart';
import 'package:explosive_harry_potter/dominio/registro_personajes.dart';

class Estado {}

class Creandose extends Estado {}

class VerPaginaPrincipal extends Estado {}

class VerListaPeronajes extends Estado {
  final String tipoPeronaje;
  final Set<Personaje> personajes;
  VerListaPeronajes({
    required this.tipoPeronaje,
    required this.personajes,
  });
}

class VerHechizos extends Estado {
  final Set<Hechizo> hechizos;

  VerHechizos({required this.hechizos});
}

class VerVaritas extends Estado {
  final Set<Varita> varitas;

  VerVaritas({required this.varitas});
}

class ErrorAlCargarJson extends Estado {}

class ErrorAlFormarPersonajes extends Estado {}

class ErrorAlFormarHechizos extends Estado {}

class Evento {}

class Creado extends Evento {}

class SolicitarTodosPersonajes extends Evento {}

class SolicitarPersonajesPorCasa extends Evento {
  final String casa;

  SolicitarPersonajesPorCasa(this.casa);
}

class SolicitarAlumnos extends Evento {}

class SolicitarStaff extends Evento {}

class SolicitarHechizos extends Evento {}

class SolicitarVaritas extends Evento {}

class BlocPotter extends Bloc<Evento, Estado> {
  BlocPotter() : super(Creandose()) {
    RepositorioJson repositorioJson = RepositorioJsonReal();
    RepositorioPersonajes repositorioPersonajes = RepositorioPersonajesReal();
    RepositorioHechizos repositorioHechizos = RepositorioHechizosReal();
    late Either<Problema, dynamic> respuestaPersonajes;
    late Either<Problema, dynamic> respuestaHechizos;
    late dynamic jsonPersonajes;
    late dynamic jsonHechizos;
    on<Creado>((event, emit) async {
      respuestaPersonajes = await repositorioJson.obtenerJsonPersonajes();
      respuestaHechizos = await repositorioJson.obtenerJsonHechizos();
      jsonPersonajes =
          respuestaPersonajes.getOrElse((l) => emit(ErrorAlCargarJson()));
      jsonHechizos =
          respuestaHechizos.getOrElse((l) => emit(ErrorAlCargarJson()));
      emit(VerPaginaPrincipal());
    });

    on<SolicitarTodosPersonajes>((event, emit) {
      Either<Problema, Set<Personaje>> personajes =
          repositorioPersonajes.obtenerPersonajes(jsonPersonajes);
      personajes.match((l) {
        emit(ErrorAlFormarPersonajes());
      }, (r) {
        emit(VerListaPeronajes(
            tipoPeronaje: "Todos los Personajes", personajes: r));
      });
    });

    on<SolicitarHechizos>((event, emit) {
      Either<Problema, Set<Hechizo>> hechizos =
          repositorioHechizos.obtenerHechizos(jsonHechizos);
      hechizos.match((l) {
        emit(ErrorAlFormarHechizos());
      }, (r) {
        emit(VerHechizos(hechizos: r));
      });
    });

    on<SolicitarVaritas>((event, emit) {
      Either<Problema, Set<Varita>> varitas =
          repositorioPersonajes.obtenerVaritas(jsonPersonajes);
      varitas.match((l) {
        emit(ErrorAlFormarPersonajes());
      }, (r) {
        emit(VerVaritas(varitas: r));
      });
    });

    on<SolicitarAlumnos>((event, emit) {
      Either<Problema, Set<Personaje>> personajes =
          repositorioPersonajes.obtenerPersonajes(jsonPersonajes);
      personajes.match((l) {
        emit(ErrorAlFormarPersonajes());
      }, (r) {
        Iterable<Personaje> alumnos =
            r.where((personaje) => personaje.esEstudiante == true);
        emit(VerListaPeronajes(
            tipoPeronaje: "Alumnos de Hogwarts", personajes: alumnos.toSet()));
      });
    });

    on<SolicitarStaff>((event, emit) {
      Either<Problema, Set<Personaje>> personajes =
          repositorioPersonajes.obtenerPersonajes(jsonPersonajes);
      personajes.match((l) {
        emit(ErrorAlFormarPersonajes());
      }, (r) {
        Iterable<Personaje> staff =
            r.where((personaje) => personaje.esStaff == true);
        emit(VerListaPeronajes(
            tipoPeronaje: "Staff de Hogwarts", personajes: staff.toSet()));
      });
    });
  }
}
