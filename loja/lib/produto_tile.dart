import 'package:flutter/material.dart';
import 'package:loja/product_model.dart';

class ProdutoTile extends StatelessWidget {
  final Product produto;
  const ProdutoTile({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              this.produto.imageLink ?? "",
              fit: BoxFit.contain,
            ),
            Text(
              produto.description ?? "",
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text("Por"),
                    Text(
                      "${produto.priceSign}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue[900]),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "${produto.price?.toStringAsFixed(2)}",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue[900]),
                  ),
                ),
              ],
            ),
            ElevatedButton(onPressed: () {}, child: Text("Comprar"))
          ],
        ),
      ),
    );
  }
}
