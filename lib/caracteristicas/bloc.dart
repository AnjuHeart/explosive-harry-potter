// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
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

class VerHechizos extends Estado {}

class VerVaritas extends Estado {}

class ErrorAlCargarJson extends Estado {}

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
  }
}
