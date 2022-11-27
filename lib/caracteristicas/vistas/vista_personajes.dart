import 'package:explosive_harry_potter/caracteristicas/bloc.dart';
import 'package:explosive_harry_potter/dominio/registro_personajes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListaPersonajes extends StatelessWidget {
  const ListaPersonajes(
      {super.key, required this.tipoDePersonaje, required this.personajes});

  final String tipoDePersonaje;
  final Set<Personaje> personajes;

  @override
  Widget build(BuildContext context) {
    List<Personaje> listaPersonajes = personajes.toList();
    var bloc = context.read<BlocPotter>();
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              bloc.add(VolverAlMenu());
            },
          ),
          title: Text(tipoDePersonaje)),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: listaPersonajes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(listaPersonajes[index].imagen),
                      title: Text(listaPersonajes[index].nombre),
                      subtitle: Text(listaPersonajes[index].casa),
                      trailing: Text((index + 1).toString()),
                    );
                  }))
        ],
      ),
    );
  }
}
