import 'package:flutter/material.dart';
import 'package:loja/form_registro.dart';

class RegistroPage extends StatelessWidget {
  const RegistroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormRegistro(),
      appBar: AppBar(
        title: Text('Registro'),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
