import "package:flutter/material.dart";

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Explosive Harry Potter"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 500,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Usuario',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5
                ),
                TextButton(onPressed: () {}, child: const Text("Buscar"))
              ],
            ),
            const SizedBox(height: 10),
            const Text("Buscar por categoría..."),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){}, child: const Text("Hechizos")),
                const SizedBox(width: 5),
                TextButton(onPressed: (){}, child: const Text("Profesores")),
                const SizedBox(width: 5),
                TextButton(onPressed: (){}, child: const Text("Alumnos")),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Buscar por casa..."),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){}, child: const Text("Griffindor")),
                const SizedBox(width: 5),
                TextButton(onPressed: (){}, child: const Text("Slytherin")),
                const SizedBox(width: 5),
                TextButton(onPressed: (){}, child: const Text("Hufflepuff")),
                const SizedBox(width: 5),
                TextButton(onPressed: (){}, child: const Text("Ravenclaw")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
