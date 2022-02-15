class Validator {
  bool _emailValid(String email) {
    final RegExp regex = RegExp(
      r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$",
    );
    return regex.hasMatch(email);
  }

  String? emailFormLogin(String email) {
    String? _response;
    if (email.isNotEmpty) {
      if (Validator()._emailValid(email)) {
      } else {
        _response = "E-mail digitado incorretamente";
        return _response;
      }
    } else {
      _response = "O email não pode estar vazio";
      return _response;
    }
    return _response;
  }

  String? password(String password) {
    String? _response;
    if (password.length <= 7) {
      _response = "A senha é muito curta";
    }
    return _response;
  }

  String? name(String name) {
    String? _response;
    if (name.isEmpty) {
     _response = 'O Campo não pode estar vazio';
    } else if (name.trim().split(' ').length <= 1) {
     _response = 'Digite um Nome Valido, Com nome e sobrenome';
    } else {}
    return _response;
  }
}
