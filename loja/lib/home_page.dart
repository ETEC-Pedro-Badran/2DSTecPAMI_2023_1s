import 'package:flutter/material.dart';

import 'produto_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Loja ETEC"),
        ),
        body: GridView.count(
          crossAxisCount: MediaQuery.of(context).size.width < 293
              ? 1
              : MediaQuery.of(context).size.width < 441
                  ? 2
                  : MediaQuery.of(context).size.width < 600
                      ? 3
                      : 4,
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
