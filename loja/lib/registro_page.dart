import 'package:flutter/material.dart';
import 'package:loja/form_registro.dart';
import 'package:loja/usuario_rest.dart';
import 'package:http/http.dart' as http;

class RegistroPage extends StatelessWidget {
  const RegistroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormRegistro(
        onSave: (usuario) => UsuarioRest().inserir(http.Client(), usuario),
      ),
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
