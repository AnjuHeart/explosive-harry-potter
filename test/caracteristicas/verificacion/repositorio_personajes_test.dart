import 'dart:convert';

import 'package:explosive_harry_potter/caracteristicas/verificacion/repositorio_personajes.dart';
import 'package:explosive_harry_potter/dominio/problemas.dart';
import 'package:explosive_harry_potter/dominio/registro_personajes.dart';
import 'package:fpdart/fpdart.dart';
import 'package:test/test.dart';

void main() {
  String pruebaDosPersonajes = """[
{
      "name":"Harry Potter",
      "alternate_names":[
         
      ],
      "species":"human",
      "gender":"male",
      "house":"Gryffindor",
      "dateOfBirth":"31-07-1980",
      "yearOfBirth":1980,
      "wizard":true,
      "ancestry":"half-blood",
      "eyeColour":"green",
      "hairColour":"black",
      "wand":{
         "wood":"holly",
         "core":"phoenix feather",
         "length":11
      },
      "patronus":"stag",
      "hogwartsStudent":true,
      "hogwartsStaff":false,
      "actor":"Daniel Radcliffe",
      "alternate_actors":[
         
      ],
      "alive":true,
      "image":"https://hp-api.herokuapp.com/images/harry.jpg"
   },
   {
      "name":"Hermione Granger",
      "alternate_names":[
         
      ],
      "species":"human",
      "gender":"female",
      "house":"Gryffindor",
      "dateOfBirth":"19-09-1979",
      "yearOfBirth":1979,
      "wizard":true,
      "ancestry":"muggleborn",
      "eyeColour":"brown",
      "hairColour":"brown",
      "wand":{
         "wood":"",
         "core":"",
         "length":null
      },
      "patronus":"otter",
      "hogwartsStudent":true,
      "hogwartsStaff":false,
      "actor":"Emma Watson",
      "alternate_actors":[
         
      ],
      "alive":true,
      "image":"https://hp-api.herokuapp.com/images/hermione.jpeg"
   }
   ]""";
  JsonDecoder decoder = const JsonDecoder();

  final jsonObject = decoder.convert(pruebaDosPersonajes);
  group("Pruebas para personajes", () {
    test("El repositorio regresa set de personajes", () {
      RepositorioPersonajes repo = RepositorioPersonajesReal();
      var x = repo.obtenerPersonajes(jsonObject);
      expect(x.isRight(), true);
    });
    test("El repositorio da dos personajes", () {
      RepositorioPersonajes repo = RepositorioPersonajesReal();
      var x = repo.obtenerPersonajes(jsonObject);
      x.match((l) => null, (r) {
        expect(r.length, 2);
      });
    });
    test("Puedo acceder a la informacion de cada personaje", () {
      RepositorioPersonajes repo = RepositorioPersonajesReal();
      var x = repo.obtenerPersonajes(jsonObject);
      x.match((l) => null, (r) {
        expect(r.last.nombre, equals("Hermione Granger"));
      });
    });
  });
  group("Pruebas para varitas", () {
    test("Hay varitas", () {
      RepositorioPersonajes repo = RepositorioPersonajesReal();
      var x = repo.obtenerVaritas(jsonObject);
      expect(x.isRight(), true);
    });

    test("Hay una varita", () {
      RepositorioPersonajes repo = RepositorioPersonajesReal();
      var x = repo.obtenerVaritas(jsonObject);
      x.match((l) => null, (r) {
        expect(r.length, equals(1));
      });
    });
  });
}
