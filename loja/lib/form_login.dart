import 'package:flutter/material.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Form(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Email", prefixIcon: Icon(Icons.email)),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Senha",
              prefixIcon: Icon(Icons.key),
              suffixIcon: Icon(Icons.visibility),
            ),
            obscureText: true,
            obscuringCharacter: "*",
          )
        ],
      )),
    );
  }
}
