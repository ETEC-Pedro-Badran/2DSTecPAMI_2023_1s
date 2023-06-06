import 'package:flutter/material.dart';

import 'home_controller.dart';


class HomePage extends StatelessWidget {
  final HomeController controller;
  const HomePage({super.key, required this.controller});


  @override
  Widget build(BuildContext context) {
    var store = controller.store;  
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
              ValueListenableBuilder(
                valueListenable: store.cliques,
                builder: (context, value, child) => 
                Text("Quantidade de Cliques: ${store.cliques.value}"),
              ),
            ],
         ),
        ElevatedButton(onPressed: (){
           controller.incrementar();
        }, child: Text("Clique aqui!")),
        Container(
          height: 400,
          child: ValueListenableBuilder(
            valueListenable: store.lista,
            builder: (context, value, child) {
              return ListView.builder(
                itemCount: store.lista.value.length,
                itemBuilder: (context, index) => ListTile(title:Text("${value[index]}")));
            }
          ))
        ],
      ),
    );
  }
}