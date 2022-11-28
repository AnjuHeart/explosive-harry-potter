import 'package:flutter/material.dart';
import 'package:explosive_harry_potter/dominio/registro_varitas.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:explosive_harry_potter/caracteristicas/bloc.dart';

class ListaVaritas extends StatelessWidget {
  const ListaVaritas({
    Key? key,
    required this.varitas,
  }) : super(key: key);

  final Set<Varita> varitas;

  @override
  Widget build(BuildContext context) {
    List<Varita> listaVaritas = varitas.toList();
    var bloc = context.read<BlocPotter>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            bloc.add(VolverAlMenu());
          },
        ),
        title: const Text("Varitas de algunos personajes"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: listaVaritas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Madera tipo ${listaVaritas[index].madera}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Nucleo: ${listaVaritas[index].nucleo == "" ? "No especificado" : listaVaritas[index].nucleo}"),
                          Text(
                            "Portador: ${listaVaritas[index].portador}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Largo: ${listaVaritas[index].largo.toString()}")
                        ],
                      ),
                      trailing: Text((index + 1).toString()),
                    );
                  }))
        ],
      ),
    );
  }
}
