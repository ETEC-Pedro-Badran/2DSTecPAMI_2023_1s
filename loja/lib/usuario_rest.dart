import 'dart:convert';
import 'dart:io';

import 'usuario_model.dart';
import 'package:http/http.dart' as http;

class UsuarioRest {
  static const _url = "http://172.16.100.38:8080/usuario.php";

  Future<void> inserir(http.Client client, Usuario usuario) async {
    return client
        .post(Uri.parse(_url), // endereço do servidor, e o recurso
            body: json.encode(usuario
                .toJson()) // converte o usuário para uma string em formato json
            )
        .then((value) {
      if (value.statusCode != 200 && !value.body.contains("Duplicate entry")) {
        throw "Usuário já registrado anteriormente!";
      } else if (!json.decode(value.body)["ok"]) {
        throw "Falha no registro do usuário.Tente novamente!";
      } else {
        return;
      }
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

  /**Função para enviar foto do usuario */
  Future<bool> enviarFoto(
      http.Client client, String url, Usuario usuario) async {
    Uri uri = Uri.parse("$_url/usuario.php");
    var request = http.MultipartRequest("POST", uri);

    Map<String, String> _body = {"usuario_id": "${usuario.id}"};
    request.fields.addAll(_body);

    request.files.add(http.MultipartFile.fromBytes(
      "foto",
      await File.fromUri(Uri.parse(usuario.foto!)).readAsBytes(),
    ));

    return await request.send().then((response) {
      if (response.statusCode < 200 || response.statusCode > 400) {
        throw response.reasonPhrase!;
      } else {
        return true;
      }
    });
  }
}
