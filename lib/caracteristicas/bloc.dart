import 'package:bloc/bloc.dart';

class Estado{}

class Creandose extends Estado{}

class Evento{}

class Creado extends Evento{}

class BlocPotter extends Bloc<Evento, Estado>{
  BlocPotter() : super(Creandose()){

  }
}