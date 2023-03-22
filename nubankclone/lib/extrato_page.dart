import 'package:flutter/material.dart';

import 'extrato_domain.dart';

class ExtratoPage extends StatelessWidget {
  const ExtratoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var extrato = <Extrato>[
      Extrato("Salario", 20000, TipoExtrato.entrada),
      Extrato("Supermercado", 120.00, TipoExtrato.saida),
      Extrato("Posto de combustível", 101.50, TipoExtrato.saida),
      Extrato("Tarifa", 12.35, TipoExtrato.saida),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("Extrato"),
        ),
        body: ListView(
            children: extrato
                .map((e) => ListTile(
                      leading: Icon(Icons.work),
                      title: Text(e.descricao),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            e.valor.toStringAsFixed(2),
                            style: TextStyle(
                                color: e.tipo == TipoExtrato.entrada
                                    ? Colors.green
                                    : Colors.red),
                          ),
                          Icon(
                            e.tipo == TipoExtrato.entrada
                                ? Icons.add
                                : Icons.remove,
                            size: 10,
                          ),
                        ],
                      ),
                      isThreeLine: false,
                      subtitle: const Text("Centro Paula Souza"),
                    ))
                .toList()));
  }
}
