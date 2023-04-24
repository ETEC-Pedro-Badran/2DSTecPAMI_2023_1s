import 'package:flutter/material.dart';

import 'produto_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Loja ETEC"),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          children: [
            ProdutoTile(),
            ProdutoTile(),
            ProdutoTile(),
            ProdutoTile()
          ],
          childAspectRatio: 0.5,
        ));
  }
}
