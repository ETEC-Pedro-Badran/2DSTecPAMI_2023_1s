import 'dart:convert';

class Usuario {
  int? id;
  String? nome;
  String? email;
  String? senha;
  String? foto;
  Usuario({this.id, this.nome, this.email, this.senha, this.foto});

  Map<String, String>? toJson() {
    return {"nome": nome!, "email": email!, "senha": senha!};
  }

  factory Usuario.fromJson(Map<String, dynamic> json_data) {
    return Usuario(
        id: json_data["id"],
        nome: json_data["nome"],
        email: json_data["email"],
        foto: json_data["foto"]);
  }
}
