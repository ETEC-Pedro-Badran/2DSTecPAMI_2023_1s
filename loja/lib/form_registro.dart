import 'package:flutter/material.dart';
import 'package:loja/usuario_model.dart';

class FormRegistro extends StatefulWidget {
  const FormRegistro({super.key});

  @override
  State<FormRegistro> createState() => _FormRegistroState();
}

class _FormRegistroState extends State<FormRegistro> {
  Usuario usuario = Usuario();

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
                onsaved: (value) => usuario.nome = value, // <<<<<
              ),
              input(
                'E-mail',
                onsaved: (value) => usuario.email = value, // <<<<<
              ),
              input('Senha',
                  validacao: (value) => (value?.length ?? 0) < 3
                      ? "Senha deve ter no mínimo 3 caracteres"
                      : null,
                  onchange: (value) => usuario.senha = value,
                  senha: true),
              input('Confirma Senha',
                  validacao: (value) =>
                      value == usuario.senha ? null : "Senha não confere!",
                  senha: true),
              ElevatedButton(
                  onPressed: () {
                    if (key.currentState?.validate() ?? false) {
                      key.currentState?.save();
                    }
                  },
                  child: Text('Salvar'))
            ],
          )),
    );
  }

  input(String label,
      {String? Function(String? value)? validacao,
      Function(String? value)? onchange,
      Function(String? value)? onsaved, // <<<<<
      bool senha = false}) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration:
              InputDecoration(label: Text(label), border: OutlineInputBorder()),
          validator: validacao,
          onChanged: onchange,
          onSaved: onsaved, // <<<<<
          obscureText: senha,
        ));
  }
}
