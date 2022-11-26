class Hechizo {
  final String nombre;
  final String descripcion;

  Hechizo._(this.nombre, this.descripcion);

  factory Hechizo.constructor({required dynamic jsonElement}) {
    String nombre = jsonElement["name"] ?? "";
    String descripcion = jsonElement["description"] ?? "";
    return Hechizo._(nombre, descripcion);
  }
}
