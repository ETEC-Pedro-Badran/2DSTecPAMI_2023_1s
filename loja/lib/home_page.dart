import 'package:flutter/material.dart';
import 'package:loja/product_model.dart';
import 'package:loja/produto_tile.dart';

import 'product_rest.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    http.Client client = http.Client();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Loja ETEC"),
        ),
        body: FutureBuilder(
            future: ProductRest().obterProdutos(client),
            builder: (context, snapshot) => !snapshot.hasData
                ? const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                    ),
                  )
                : GridView.count(
                    crossAxisCount: MediaQuery.of(context).size.width < 293
                        ? 1
                        : MediaQuery.of(context).size.width < 441
                            ? 2
                            : MediaQuery.of(context).size.width < 600
                                ? 3
                                : 4,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    childAspectRatio: 0.5,
                    children: snapshot.data!
                        .map<Widget>((e) => ProdutoTile(produto: e))
                        .toList(),
                  )));
  }
}
