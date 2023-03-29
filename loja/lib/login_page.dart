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
              FormLogin()
            ],
          ),
        ],
      ),
    );
  }
}
