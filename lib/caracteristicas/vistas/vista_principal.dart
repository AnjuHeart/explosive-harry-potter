import 'package:cached_network_image/cached_network_image.dart';
import 'package:explosive_harry_potter/caracteristicas/bloc.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<BlocPotter>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl:
                  "https://cdn.discordapp.com/attachments/1037900493088899092/1046612535765385286/explosivo.png",
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  const Center(child: Text("No puede cargar la imagen")),
              width: 400,
              height: 300,
            ),
            const Text(
              "Buscar por categoría...",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      bloc.add(SolicitarTodosPersonajes());
                    },
                    child: const Text("Todos los Personajes")),
                const SizedBox(width: 5),
                TextButton(
                    onPressed: () {
                      bloc.add(SolicitarHechizos());
                    },
                    child: const Text("Hechizos")),
                const SizedBox(width: 5),
                TextButton(
                    onPressed: () {
                      bloc.add(SolicitarStaff());
                    },
                    child: const Text("Profesores")),
                const SizedBox(width: 5),
                TextButton(
                    onPressed: () {
                      bloc.add(SolicitarAlumnos());
                    },
                    child: const Text("Alumnos")),
                const SizedBox(width: 5),
                TextButton(
                    onPressed: () {
                      bloc.add(SolicitarVaritas());
                    },
                    child: const Text("Varitas")),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Buscar personajes por casa...",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      bloc.add(SolicitarPersonajesPorCasa("Gryffindor"));
                    },
                    child: const Text("Gryffindor")),
                const SizedBox(width: 5),
                TextButton(
                    onPressed: () {
                      bloc.add(SolicitarPersonajesPorCasa("Slytherin"));
                    },
                    child: const Text("Slytherin")),
                const SizedBox(width: 5),
                TextButton(
                    onPressed: () {
                      bloc.add(SolicitarPersonajesPorCasa("Hufflepuff"));
                    },
                    child: const Text("Hufflepuff")),
                const SizedBox(width: 5),
                TextButton(
                    onPressed: () {
                      bloc.add(SolicitarPersonajesPorCasa("Ravenclaw"));
                    },
                    child: const Text("Ravenclaw")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
