import 'package:flutter/material.dart';

import 'form_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(height: 100, width: 100, "imagens/logo.png"),
              FormLogin(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Ou",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/registrar');
                  },
                  child: Text("Registrar-se"))
            ],
          ),
        ],
      ),
    );
  }
}
