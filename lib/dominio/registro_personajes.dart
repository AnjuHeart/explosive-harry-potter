class Personaje {
  final String nombre;
  final dynamic nombreAlternativo;
  final String especie;
  final String genero;
  final String casa;
  final String fechaDeNacimiento;
  final int anoNacimiento;
  final bool esMago;
  final String linaje;
  final String colorOjos;
  final String colorCabello;
  final dynamic varita;
  final String patronus;
  final bool esEstudiante;
  final bool esStaff;
  final String actor;
  final dynamic actoresAlternativos;
  final bool estaVivo;
  final String imagen;

  factory Personaje.constructor({required dynamic jsonElement}) {
    String nombre = jsonElement["name"] ?? "";
    dynamic nombreAlternativo = jsonElement["alternate_names"] ?? "";
    String especie = jsonElement["species"] ?? "";
    String genero = jsonElement["gender"] ?? "";
    String casa = jsonElement["house"] ?? "";
    String fechaDeNacimiento = jsonElement["dateOfBirth"] ?? "";
    int anoNacimiento = jsonElement["yearOfBirth"] ?? 0;
    bool esMago = jsonElement["wizard"] ?? false;
    String linaje = jsonElement["ancestry"] ?? "";
    String colorOjos = jsonElement["eyeColour"] ?? "";
    String colorCabello = jsonElement["hairColour"] ?? "";
    dynamic varita = jsonElement["wand"] ?? "";
    String patronus = jsonElement["patronus"] ?? "";
    bool esEstudiante = jsonElement["hogwartsStudent"] ?? false;
    bool esStaff = jsonElement["hogwartsStaff"] ?? false;
    String actor = jsonElement["actor"] ?? "";
    dynamic actoresAlternativos = jsonElement["alternate_actors"] ?? "";
    bool estaVivo = jsonElement["alive"] ?? false;
    String imagen = jsonElement["image"] ?? "";
    return Personaje._(
        nombre,
        nombreAlternativo,
        especie,
        genero,
        casa,
        fechaDeNacimiento,
        anoNacimiento,
        esMago,
        linaje,
        colorOjos,
        colorCabello,
        varita,
        patronus,
        esEstudiante,
        esStaff,
        actor,
        actoresAlternativos,
        estaVivo,
        imagen);
  }

  Personaje._(
      this.nombre,
      this.nombreAlternativo,
      this.especie,
      this.genero,
      this.casa,
      this.fechaDeNacimiento,
      this.anoNacimiento,
      this.esMago,
      this.linaje,
      this.colorOjos,
      this.colorCabello,
      this.varita,
      this.patronus,
      this.esEstudiante,
      this.esStaff,
      this.actor,
      this.actoresAlternativos,
      this.estaVivo,
      this.imagen);
}
