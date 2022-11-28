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
                      leading: listaPersonajes[index].imagen == ""
                          ? const Text(
                              "No tiene imagen",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          : Image.network(listaPersonajes[index].imagen),
                      title: Text(listaPersonajes[index].nombre),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Casa: ${listaPersonajes[index].casa == "" ? "No especificado" : listaPersonajes[index].casa}"),
                          Text("Especie: ${listaPersonajes[index].especie}"),
                          Text("Género: ${listaPersonajes[index].genero}"),
                          Text(
                              "Año de nacimiento: ${listaPersonajes[index].anoNacimiento.toString() != "0" ? listaPersonajes[index].anoNacimiento.toString() : "No especificado"}"),
                          Text(
                              "Fecha de nacimiento: ${listaPersonajes[index].fechaDeNacimiento == "" ? "No especificado" : listaPersonajes[index].fechaDeNacimiento}"),
                          Text(
                              "¿Es mago?: ${listaPersonajes[index].esMago ? "Sí" : "No"}"),
                          Text(
                              "Linaje: ${listaPersonajes[index].linaje == "" ? "No especificado" : listaPersonajes[index].linaje}"),
                          Text(
                              "Color de ojos: ${listaPersonajes[index].colorOjos == "" ? "No especificado" : listaPersonajes[index].colorOjos}"),
                          Text(
                              "Color de cabello: ${listaPersonajes[index].colorCabello == "" ? "No especificado" : listaPersonajes[index].colorCabello}"),
                          Text(
                              "Varita: ${listaPersonajes[index].varita["wood"] != "" ? listaPersonajes[index].varita["wood"] : "Sin especificar"}"),
                          Text(
                              "Patronus: ${listaPersonajes[index].patronus == "" ? "No especificado" : listaPersonajes[index].patronus}"),
                          Text(
                              "¿Es estudiante de Hogwarts?: ${listaPersonajes[index].esEstudiante ? "Sí" : "No"}"),
                          Text(
                              "¿Es staff de Hogwarts?: ${listaPersonajes[index].esStaff ? "Sí" : "No"}"),
                          Text(
                              "Actor: ${listaPersonajes[index].actor == "" ? "No asignado" : listaPersonajes[index].actor}"),
                          Text(
                              "¿Está vivo?: ${listaPersonajes[index].estaVivo ? "Sí" : "No"}"),
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
