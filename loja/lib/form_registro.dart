import 'package:flutter/material.dart';
import 'package:loja/usuario_model.dart';

class FormRegistro extends StatefulWidget {
  final Usuario? inicial; // usuario para ser alterado
  final Future<void> Function(Usuario usuario)
      onSave; // método para salvar o usuário
  const FormRegistro({super.key, this.inicial, required this.onSave});

  @override
  State<FormRegistro> createState() => _FormRegistroState();
}

class _FormRegistroState extends State<FormRegistro> {
  late Usuario usuario;
  @override
  void initState() {
    usuario = widget.inicial ?? Usuario();
    super.initState();
  }

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
          key: key,
          child: Column(
            children: [
              input('Nome',
                  validacao: (value) {
                    if ((value?.length ?? 0) < 2) {
                      return 'Nome deve ter mais que dois caracteres';
                    } else {
                      return null;
                    }
                  },
                  onsaved: (value) => usuario.nome = value, // <<<<<
                  valorInicial: usuario.nome),
              input('E-mail',
                  onsaved: (value) => usuario.email = value,
                  validacao: (value) => !(value?.contains("@") ?? false)
                      ? "E-mail inválido"
                      : null, // <<<<<
                  valorInicial: usuario.email),
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
                  onPressed: () async {
                    if (key.currentState?.validate() ?? false) {
                      key.currentState?.save();
                      
                        await widget.onSave(usuario);
                      
                    }
                  },
                  child: const Text('Salvar'))
            ],
          )),
    );
  }

  input(String label,
      {String? Function(String? value)? validacao,
      Function(String? value)? onchange,
      Function(String? value)? onsaved, // <<<<<
      bool senha = false,
      dynamic? valorInicial}) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          initialValue: valorInicial,
          decoration:
              InputDecoration(label: Text(label), border: OutlineInputBorder()),
          validator: validacao,
          onChanged: onchange,
          onSaved: onsaved, // <<<<<
          obscureText: senha,
        ));
  }
}
