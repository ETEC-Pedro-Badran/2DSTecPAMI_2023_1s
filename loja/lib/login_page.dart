import 'package:flutter/material.dart';

import 'app_store.dart';
import 'form_login.dart';

class LoginPage extends StatelessWidget {
  final AppStore appStore;
  const LoginPage({super.key, required this.appStore});

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
              FormLogin(
                appStore: appStore,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
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
