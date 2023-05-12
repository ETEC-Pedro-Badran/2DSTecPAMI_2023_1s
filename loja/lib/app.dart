import 'package:flutter/material.dart';
import 'package:loja/registro_page.dart';

import 'app_store.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'perfil_page.dart';

class App extends StatelessWidget {
  final AppStore appStore;
  const App({super.key, required this.appStore});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      //home: LoginPage(),
      initialRoute: "/login",
      routes: {
        '/login': (context) => LoginPage(
              appStore: appStore,
            ),
        '/registrar': (context) => RegistroPage(),
        '/perfil': (context) => PerfilPage(),
        '/': (context) => HomePage(
              appStore: appStore,
            ),
      },
    );
  }
}
