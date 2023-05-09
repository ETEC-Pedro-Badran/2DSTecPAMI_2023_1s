

import 'dart:convert';

import 'usuario_model.dart';
import 'package:http/http.dart' as http;

class UsuarioRest {
   static const _url = "http://localhost:8080/usuario.php"; 
 
 
   Future<void> inserir(http.Client client, Usuario usuario) async {
    return client.post(
      Uri.parse(_url), // endereço do servidor, e o recurso
      body: json.encode(usuario.toJson()) // converte o usuário para uma string em formato json
    ).then((value) {
       if (value.statusCode!=200 && !value.body.contains("Duplicate entry"))  {
        throw "Usuário já registrado anteriormente!";
       } else if (!json.decode(value.body)["ok"]) {
        throw "Falha no registro do usuário.Tente novamente!";
       } else {
        return;
       }
    }
     );
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
