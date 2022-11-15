import 'package:bloc/bloc.dart';

class Estado{}

class Creandose extends Estado{}

class VerPaginaPrincipal extends Estado{}

class Evento{}

class Creado extends Evento{}

class BlocPotter extends Bloc<Evento, Estado>{
  BlocPotter() : super(Creandose()){
    on<Creado>((event, emit) {
      emit(VerPaginaPrincipal());
    });
  }
}