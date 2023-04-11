import 'package:flutter/material.dart';
import 'package:loja/usuario_model.dart';

class FormRegistro extends StatefulWidget {
  const FormRegistro({super.key});

  @override
  State<FormRegistro> createState() => _FormRegistroState();
}

class _FormRegistroState extends State<FormRegistro> {
  Usuario usuario = Usuario('', '', '');

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
          key: key,
          child: Column(
            children: [
              input(
                'Nome',
                validacao: (value) {
                  if ((value?.length ?? 0) < 2) {
                    return 'Nome deve ter mais que dois caracteres';
                  } else {
                    return null;
                  }
                },
              ),
              input('E-mail'),
              input('Senha'),
              input('Confirma Senha'),
              ElevatedButton(
                  onPressed: () {
                    key.currentState?.validate();
                  },
                  child: Text('Salvar'))
            ],
          )),
    );
  }

  input(String label, {String? Function(String? value)? validacao}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          decoration:
              InputDecoration(label: Text(label), border: OutlineInputBorder()),
          validator: validacao),
    );
  }
}
