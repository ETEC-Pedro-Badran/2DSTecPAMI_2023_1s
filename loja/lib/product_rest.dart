import 'package:http/http.dart' as http;

class ProductRest {
  obterProdutos(http.Client client) {
    return client
        .get(Uri.parse("http://makeup-api.herokuapp.com/api/v1/products.json"))
        .then((value) {
      print(value);
    });
  }
}
