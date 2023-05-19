import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:loja/usuario_model.dart';
import 'package:loja/usuario_rest.dart';

void main() {
  testWidgets('inserir usuario rest ...', (tester) async {
    var client = MockClient(
        (request) => Future.value(http.Response('{"ok":true}', 200)));
    var usuario = Usuario(
        email: "teste@xmail.com.br", nome: "Teste", senha: "A8765i4321&");

    await UsuarioRest().inserir(client, usuario);
  });

  testWidgets('validar usuario rest ...', (tester) async {
    var client = MockClient((request) => Future.value(http.Response(
        '{"ok":true,"usuario":{"id":1,"email": "teste@xmail.com.br", "nome": "Teste"}}',
        200)));

    Usuario usuario = await UsuarioRest()
        .validar(client, "teste@xmail.com.br", "A8765i4321&");
    expect(usuario, isNotNull);
  });

  testWidgets('confirmar senha usuario rest ...', (tester) async {
    var client = MockClient((request) => Future.value(http.Response('', 403)));

    try {
      Usuario usuario = await UsuarioRest()
          .validar(client, "teste@xmail.com.br", "A8765i4321&");
    } catch (e) {
      expect(e, isException, reason: 'Validação do usuário');
    }
  });
}
