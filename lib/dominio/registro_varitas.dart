class Varita {
  final String madera;
  final String nucleo;
  final int largo;
  final String portador;

  factory Varita.constructor({required dynamic jsonElement}) {
    String portador = jsonElement["name"] ?? "";
    var varita = jsonElement["wand"];
    String madera = varita["wood"] ?? "";
    String nucleo = varita["core"] ?? "";
    int largo = varita["length"] ?? 0;
    return Varita._(madera, nucleo, largo, portador);
  }

  Varita._(this.madera, this.nucleo, this.largo, this.portador);
}
