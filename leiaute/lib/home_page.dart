import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var listaContainer = [
      Container(height: 80, width: 80, color: Colors.teal),
      Container(height: 80, width: 80, color: Colors.red),
      Container(height: 80, width: 80, color: Colors.blue),
      Container(height: 80, width: 80, color: Colors.yellow),
      Container(height: 80, width: 80, color: Colors.black12),
    ];

    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      ...listaContainer,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: listaContainer,
      ),
    ]);
  }
}
