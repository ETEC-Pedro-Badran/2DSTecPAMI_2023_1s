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
        onSave: (usuario) async {
          try {
             await UsuarioRest().inserir(http.Client(), usuario);
             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Atualização concluída!")));
             Navigator.pop(context); // fechando a tela atual

          } catch(e){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
          }
          
        },
      ),
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
