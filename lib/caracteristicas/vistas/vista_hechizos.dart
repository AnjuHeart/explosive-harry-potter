// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:explosive_harry_potter/caracteristicas/bloc.dart';
import 'package:explosive_harry_potter/dominio/registro_hechizos.dart';

class ListaHechizos extends StatelessWidget {
  const ListaHechizos({
    Key? key,
    required this.hechizos,
  }) : super(key: key);

  final Set<Hechizo> hechizos;

  @override
  Widget build(BuildContext context) {
    List<Hechizo> listaHechizos = hechizos.toList();
    var bloc = context.read<BlocPotter>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            bloc.add(VolverAlMenu());
          },
        ),
        title: Text("Hechizos de Harry Potter"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: listaHechizos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(listaHechizos[index].nombre),
                      subtitle: Text(listaHechizos[index].descripcion),
                      trailing: Text((index + 1).toString()),
                    );
                  }))
        ],
      ),
    );
  }
}
