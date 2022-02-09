class Validator {
  bool emailValid(String email) {
    final RegExp regex = RegExp(
      r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$",
    );
    return regex.hasMatch(email);
  }

  String emailFormLogin(String email) {
     String _response = "";
    if (email.isNotEmpty) {
      if (Validator().emailValid(email)) {
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
}
