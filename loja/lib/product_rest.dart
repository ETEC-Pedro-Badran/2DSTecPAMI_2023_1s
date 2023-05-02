import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loja/product_model.dart';

class ProductRest {
  Future<dynamic> obterProdutos(http.Client client) async {
    return client
        .get(Uri.parse(
            "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"))
        .then((value) {
      if (value.statusCode != 200) {
        throw "Recurso não encontrado.";
      } else {
        List<dynamic> dados = json.decode(value.body);
        var produtos = dados.map((e) {
          try {
            return Product.fromJson(e);
          } catch (e) {
            print(e);
          }
        }).toList();
        return produtos;
      }
    });
  }
}
