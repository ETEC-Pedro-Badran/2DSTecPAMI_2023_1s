import 'dart:convert';

class Usuario {
  int? id;
  String? nome;
  String? email;
  String? senha;
  String? foto;
  Usuario({this.id, this.nome, this.email, this.senha, this.foto});

  //Converte o objeto para uma representação em Map<String,String>
  Map<String, String>? toJson() {
    return {"nome": nome!, "email": email!, "senha": senha!,...id!=null?{"id":"$id"}:{}};
  }

  //Converte um Map<String,dynamic> em um objeto Usuario
  factory Usuario.fromJson(Map<String, dynamic> json_data) {
    return Usuario(
        id: json_data["id"],
        nome: json_data["nome"],
        email: json_data["email"],
        foto: json_data["foto"]);
  }
}
