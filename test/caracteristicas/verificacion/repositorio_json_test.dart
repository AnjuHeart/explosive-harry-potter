import 'package:explosive_harry_potter/caracteristicas/verificacion/repositorio_json.dart';
import 'package:test/test.dart';

void main() {
  test("El repositorio regresa un json", () async {
    RepositorioJson repo = RepositorioJsonReal();
    var x = await repo.obtenerJsonPersonajes();
    expect(x.isRight(), true);
  });
  group("Pruebas para personajes", () {
    test("Puedo acceder al primer valor", () async {
      RepositorioJson repo = RepositorioJsonReal();
      var x = await repo.obtenerJsonPersonajes();
      var y = x.getOrElse((l) => null);
      expect(y[0]["name"] == "Harry Potter", true);
    });
    test("Hay un total de 403 personajes", () async {
      RepositorioJson repo = RepositorioJsonReal();
      var x = await repo.obtenerJsonPersonajes();
      var y = x.getOrElse((l) => null);
      expect(y.length, equals(403));
    });
  });
  group("Pruebas para hechizos", () {
    test("Puedo acceder al primer hechizo", () async {
      RepositorioJson repo = RepositorioJsonReal();
      var x = await repo.obtenerJsonHechizos();
      var y = x.getOrElse((l) => null);
      expect(y[0]["name"] == "Aberto", true);
    });
    test("Hay un total de 77 hechizos", () async {
      RepositorioJson repo = RepositorioJsonReal();
      var x = await repo.obtenerJsonHechizos();
      var y = x.getOrElse((l) => null);
      expect(y.length, equals(77));
    });
  });

  group("Pruebas offline", () {
    test("Puedo acceder al primer hechizo", () async {
      RepositorioJson repo = RepositorioJsonPruebas();
      var x = await repo.obtenerJsonHechizos();
      var y = x.getOrElse((l) => null);
      expect(y[0]["name"] == "Aberto", true);
    });
    test("Hay un total de 8 hechizos", () async {
      RepositorioJson repo = RepositorioJsonPruebas();
      var x = await repo.obtenerJsonHechizos();
      var y = x.getOrElse((l) => null);
      expect(y.length, equals(8));
    });
    test("Puedo acceder al primer valor", () async {
      RepositorioJson repo = RepositorioJsonPruebas();
      var x = await repo.obtenerJsonPersonajes();
      var y = x.getOrElse((l) => null);
      expect(y[0]["name"] == "Harry Potter", true);
    });
    test("Hay un total de 11 personajes", () async {
      RepositorioJson repo = RepositorioJsonPruebas();
      var x = await repo.obtenerJsonPersonajes();
      var y = x.getOrElse((l) => null);
      expect(y.length, equals(11));
    });
  });
}
