import 'package:flutter/material.dart';

import 'extrato_domain.dart';

class ExtratoPage extends StatefulWidget {
  const ExtratoPage({super.key});

  @override
  State<ExtratoPage> createState() => _ExtratoPageState();
}

class _ExtratoPageState extends State<ExtratoPage> {
  var extratos = <Extrato>[
    Extrato("Salario", 20000, TipoExtrato.entrada),
    Extrato("Supermercado", 120.00, TipoExtrato.saida),
    Extrato("Posto de combustível", 101.50, TipoExtrato.saida),
    Extrato("Tarifa", 12.35, TipoExtrato.saida),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Extrato"),
      ),
      body: ListView(
          children: extratos
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
              .toList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            double saldo = 0.0;
            for (var extrato in extratos) {
              saldo += (extrato.tipo == TipoExtrato.entrada ? 1 : -1) *
                  extrato.valor;
            }
            extratos.add(Extrato("Saldo Final", saldo,
                saldo > 0.0 ? TipoExtrato.entrada : TipoExtrato.saida));
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
