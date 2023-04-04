import 'package:flutter/material.dart';
import 'package:loja/registro_page.dart';

import 'home_page.dart';
import 'login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      //home: LoginPage(),
      initialRoute: "/login",
      routes: {
        '/login': (context) => LoginPage(),
        '/registrar': (context) => RegistroPage(),
        '/': (context) => HomePage()
      },
    );
  }
}
