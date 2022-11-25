import 'package:explosive_harry_potter/caracteristicas/verificacion/repositorio_json.dart';
import 'package:test/test.dart';

void main() {
  test("El repositorio regresa un json", () async {
    RepositorioJson repo = RepositorioJsonReal();
    var x = await repo.obtenerJsonPersonajes();
    expect(x.isRight(), true);
  });
  test("Puedo acceder al primer valor", () async {
    RepositorioJson repo = RepositorioJsonReal();
    var x = await repo.obtenerJsonPersonajes();
    var y = x.getOrElse((l) => null);
    expect(y[0]["name"] == "Harry Potter", true);
  });
}
