import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loja/product_model.dart';

class ProductRest {
  obterProdutos(http.Client client) {
    return client
        .get(Uri.parse("http://makeup-api.herokuapp.com/api/v1/products.json"))
        .then((value) {
      if (value.statusCode != 200) {
        throw "Recurso não encontrado.";
      } else {
        List<dynamic> dados = json.decode(value.body);
        return dados.map((e) => Product.fromJson(e)).toList();
      }
    });
  }
}
