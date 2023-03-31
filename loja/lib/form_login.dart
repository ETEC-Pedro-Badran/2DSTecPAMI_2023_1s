import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  var visivel = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *
          0.8, //largura propocional ao da tela
      child: Form(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Email", prefixIcon: Icon(Icons.email)),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Senha",
              prefixIcon: Icon(Icons.key),
              suffixIcon: IconButton(
                icon: Icon(!visivel ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    visivel = !visivel;
                    print(visivel);
                  });
                },
              ),
            ),
            obscureText: !visivel, // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            obscuringCharacter: "*",
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/");
            },
            child: Text("Entrar"),
          )
        ],
      )),
    );
  }
}
