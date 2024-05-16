class Personas {
  String cedula;
  String primerNombre;
  String segundoNombre;
  String primerApellido;
  String segundoApellido;
  String correo;
  String contrasena;
  String usuario;
  String identification = '';
  String urlPhoto;

  Personas(
      {required this.cedula,
      required this.primerNombre,
      required this.segundoNombre,
      required this.primerApellido,
      required this.segundoApellido,
      required this.correo,
      required this.contrasena,
      required this.usuario,
      required this.urlPhoto});
  factory Personas.fromJson(Map<String, dynamic> json) {
    return Personas(
      cedula: json['identification'] ?? 0,
      primerNombre: json['name'] ?? 0,
      primerApellido: json['lastname'] ?? 0,
      correo: json['email'] ?? 0,
      segundoApellido: '',
      contrasena: '',
      usuario: '',
      urlPhoto: json['urlPhoto'] ?? '',
      segundoNombre: '',
    );
  }
}

/**Personas(
          cedula: '',
          primerNombre: '',
          segundoNombre: '',
          primerApellido: '',
          segundoApellido: '',
          correo: '',
          contrasena: '',
          usuario: ''); */