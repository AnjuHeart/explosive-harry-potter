import 'package:explosive_harry_potter/caracteristicas/bloc.dart';
import 'package:explosive_harry_potter/caracteristicas/vistas/vista_hechizos.dart';
import 'package:explosive_harry_potter/caracteristicas/vistas/vista_personajes.dart';
import 'package:explosive_harry_potter/caracteristicas/vistas/vista_principal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Aplicacion());
}

class Aplicacion extends StatelessWidget {
  const Aplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        BlocPotter bloc = BlocPotter();
        Future.delayed(const Duration(seconds: 2), () {
          bloc.add(Creado());
        });
        return bloc;
      },
      child: const SelectorVista(),
    );
  }
}

class SelectorVista extends StatelessWidget {
  const SelectorVista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: ((context) {
          var estado = context.watch<BlocPotter>().state;
          if (estado is VerPaginaPrincipal) {
            return const PaginaPrincipal();
          }
          if (estado is VerListaPeronajes) {
            return ListaPersonajes(
                tipoDePersonaje: estado.tipoPeronaje,
                personajes: estado.personajes);
          }
          if (estado is VerHechizos) {
            return ListaHechizos(hechizos: estado.hechizos);
          }
          return const Scaffold(
            body: Center(child: Text("No implementado...")),
          );
        }),
      ),
    );
  }
}
