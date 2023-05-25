import 'dart:convert';
import 'dart:io';

import 'usuario_model.dart';
import 'package:http/http.dart' as http;

class UsuarioRest {
  //static const _url = "http://172.16.100.38:8080/usuario.php";
  static const _url = "http://172.16.100.76:8080/usuario.php";

  Future<void> inserir(http.Client client, Usuario usuario) async {
    return client
        .post(Uri.parse(_url), // endereço do servidor, e o recurso
            body: json.encode(usuario
                .toJson()) // converte o usuário para uma string em formato json
            )
        .then((value) {
      if (value.statusCode == 500) {
        throw "Erro interno do servidor!";
      } else if (value.statusCode != 200 && !value.body.contains("Duplicate entry")) {
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
  Future<bool> atualizar(http.Client client, Usuario usuario) async {
    Uri uri = Uri.parse("$_url/usuario.php");
    Map<String,String> data = usuario.toJson()!;
    String? foto;
    /** Caso o caminho para a imagem for um de um arquivo no armazenamento local do dispositivo */
    if (usuario.foto!=null && !Uri.parse(usuario.foto!).isScheme("HTTP") && !Uri.parse(usuario.foto!).isScheme("HTTPS"))     {
      File file = await File.fromUri(Uri.parse(usuario.foto!)); // carregue o arquivo dentro de objeto File
      foto = base64Encode(file.readAsBytesSync());
      data['upload'] = foto;
    }
    return await client.post(uri,body:data).then((response) {
      if (response.statusCode < 200 || response.statusCode > 400) {
        throw response.reasonPhrase!;
      } else {
        return true;
      }
    });
  }
}

