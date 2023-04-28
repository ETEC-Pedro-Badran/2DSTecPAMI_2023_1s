import 'package:flutter/material.dart';

class ProdutoTile extends StatelessWidget {
  const ProdutoTile({super.key});

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
              "https://a-static.mlcdn.com.br/618x463/smartphone-samsung-galaxy-a23-128gb-branco-4g-octa-core-4gb-ram-66-cam-quadrupla-selfie-8mp/magazineluiza/234749900/ca9fa16bf1cfd38bb5923eec9e2cfd53.jpg",
              fit: BoxFit.contain,
            ),
            Text(
              "Smartphone Samsung Galaxy A23 128GB Branco 4G - Octa-Core 4GB RAM 6,6” Câm Quádrupla + Selfie 8MP",
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
                      r"R$",
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
                    "1.199",
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
