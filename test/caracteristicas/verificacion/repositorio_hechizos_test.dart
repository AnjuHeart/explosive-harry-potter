import 'dart:convert';

import 'package:explosive_harry_potter/caracteristicas/verificacion/repositorio_hechizos.dart';
import 'package:test/test.dart';

void main() {
  String hechizosPrueba = """
          [{
              "name":"Aberto",
              "description":"Opens locked doors"
          },
          {
              "name":"Accio",
              "description":"Summons objects"
          },
          {
              "name":"Aguamenti",
              "description":"Summons water"
          },
          {
              "name":"Alohomora",
              "description":"Unlocks objects"
          },
          {
              "name":"Anapneo",
              "description":"Clears someone's airway"
          },
          {
              "name":"Aparecium",
              "description":"Reveals secret written messages"
          },
          {
              "name":"Apparate",
              "description":"A non-verbal transportation spell that allows a witch or wizard to instantly travel on the spot and appear at another location (disapparate is the opposite)"
          }]
          """;
  JsonDecoder decoder = const JsonDecoder();

  final jsonObject = decoder.convert(hechizosPrueba);
  test("Hechizos bien formados", () {
    RepositorioHechizos repo = RepositorioHechizosReal();
    var x = repo.obtenerHechizos(jsonObject);
    expect(x.isRight(), true);
  });
  test("Hay 7 hechizos", () {
    RepositorioHechizos repo = RepositorioHechizosReal();
    var x = repo.obtenerHechizos(jsonObject);
    x.match((l) => null, (r) {
      expect(r.length, equals(7));
    });
  });
  test("Es posible acceder a la información de los hechizos", () {
    RepositorioHechizos repo = RepositorioHechizosReal();
    var x = repo.obtenerHechizos(jsonObject);
    x.match((l) => null, (r) {
      expect(r.toList()[3].nombre, equals("Alohomora"));
    });
  });
}
