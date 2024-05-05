//Servicio de personas

class PersonasS {
  dynamic validateUser(String user) {
    if (user.isEmpty) {
      return "El campo esta vacio";
    }
    if (user.contains(' ')) {
      return "El campo no puede contener vacios";
    }
    if (user.contains(RegExp(r'[A-Z]'))) {
      return "El campo solo puede contener valores alfanumericos";
    }
    if (user.contains(RegExp(r'^[\W_]+$'))) {
      return "El campo solo puede contener valores alfanumericos";
    }
    return null;
  }

  dynamic validateCedula(String cedula) {
    if (cedula.isEmpty) {
      return "El campo esta vacio";
    }
    if (cedula.contains(' ')) {
      return "El campo no puede contener vacios";
    }
    if (!cedula.contains(RegExp(r'^[0-9]+$'))) {
      return "El campo solo puede contener valores Numericos";
    }
    if (cedula.contains(RegExp(r'^[!@#\$%^&*()_+{}\[\]:;<>,.?/~`|\-=\\]+$'))) {
      return "El campo solo puede contener valores Numericos";
    }
    return null;
  }

  dynamic validatePass(String user) {
    if (user.isEmpty) {
      return "El campo esta vacio";
    }
    if (user.contains(' ')) {
      return "El campo no puede contener vacios";
    }
    return null;
  }

  dynamic validateName(String user) {
    if (user.isEmpty) {
      return "El campo esta vacio";
    }
    if (user.contains(' ')) {
      return "El campo no puede contener vacios";
    }
    if (!user.contains(RegExp(r'^[a-zA-Z]+$'))) {
      return "El campo solo puede contener valores alfanumericos";
    }
    if (user.contains(RegExp(r'^[!@#\$%^&*()_+{}\[\]:;<>,.?/~`|\-=\\]+$'))) {
      return "El campo no puede contener simbolos";
    }
    return null;
  }

  dynamic validateEmail(String email) {
    if (email.isEmpty) {
      return "El campo esta vacio";
    }
    if (email.contains(' ')) {
      return "El campo no puede contener vacios";
    }
    if (!email.contains(RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'))) {
      return "El campo solo puede ser de tipo email";
    }
    return null;
  }
}
