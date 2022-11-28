class Varita {
  final String madera;
  final String nucleo;
  final num largo;
  final String portador;

  factory Varita.constructor(
      {required String madera,
      required String nucleo,
      required String portador,
      required num largo}) {
    return Varita._(madera, nucleo, largo, portador);
  }

  Varita._(this.madera, this.nucleo, this.largo, this.portador);
}
