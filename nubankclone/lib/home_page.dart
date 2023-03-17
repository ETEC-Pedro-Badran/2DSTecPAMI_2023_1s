import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nubankclone/opcoes_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    color: Colors.white24, shape: BoxShape.circle),
                child: Icon(Icons.person_outline)),
            actions: [
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.visibility_outlined)),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.help_outline_outlined))
            ],
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 18.0, bottom: 18),
                      child: Text(
                        "Prof. Evaldo",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ))),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Conta PJ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_rounded,
                          size: 20,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      r'R$ 2.500,52',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          OpcaoWidget(icon: Icons.pix, rotulo: "Pix"),
                          OpcaoWidget(
                              icon: Icons.local_atm_rounded, rotulo: "Cobrar"),
                          OpcaoWidget(
                              icon: FontAwesomeIcons.barcode, rotulo: "Pagar"),
                          OpcaoWidget(
                              icon: Icons.price_change_outlined,
                              rotulo: "Transferir"),
                          OpcaoWidget(
                              icon: Icons.add_card_outlined,
                              rotulo: "Depositar"),
                        ],
                      ),
                    ),
                    Container(
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.credit_card_outlined),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Meus cartões")
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                color: Colors.grey[100],
                height: 8,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
                color: Colors.white,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "Descubra Mais",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Chaves Pix",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Simplifique a maneira de receber transferencias na sua conta PJ.",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Conhecer"),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
