import 'dart:convert';

import 'package:http/http.dart' as http;

import 'usuario_model.dart';

const _url = "http://localhost:8080/usuario.php";

class UsuarioRest {
  Future<void> inserir(http.Client client, Usuario usuario) async {
    return client
        .post(Uri.parse(_url), body: json.encode(usuario.toJson()))
        .then((value) {
      if (value.statusCode != 200 && value.body.contains("Duplicate entry")) {
        throw "Usuário já foi registrado anteriormente.";
      } else if (!json.decode(value.body)["ok"]) {
        throw "Falha no registro.Tente novamente.";
      } else
        return;
    });
  }

  Future<Usuario> validar(
      http.Client client, String email, String senha) async {
    return client
        .get(Uri.parse("$_url/usuario.php?email=$email&senha=$senha"))
        .then((value) {
      if (value.statusCode != 200 && value.body.contains("Duplicate entry")) {
        throw "Usuário já foi registrado anteriormente.";
      } else {
        var json_data = json.decode(value.body);
        if (json_data.length > 0 && json_data['ok']) {
          return Usuario.fromJson(json_data['usuario']);
        } else {
          throw "Usuário não identificado";
        }
      }
    });
  }
}
