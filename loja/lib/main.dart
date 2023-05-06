import 'package:flutter/material.dart';
import 'package:loja/app_store.dart';

import 'app.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppStore appStore = AppStore();
    return App(appStore: appStore);
  }
}
