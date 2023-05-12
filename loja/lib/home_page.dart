import 'package:flutter/material.dart';
import 'package:loja/produto_tile.dart';

import 'app_store.dart';
import 'product_rest.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final AppStore appStore;
  const HomePage({super.key, required this.appStore});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    http.Client client = http.Client();
    return Scaffold(
        key: _key,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Loja ETEC"),
          actions: [
            avatar(context, onPress: () {
              _key.currentState?.openDrawer();
            })
          ],
        ),
        body: FutureBuilder(
            future: ProductRest().obterProdutos(client),
            builder: (context, snapshot) => !snapshot.hasData
                ? const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                    ),
                  )
                : GridView.count(
                    crossAxisCount: MediaQuery.of(context).size.width < 293
                        ? 1
                        : MediaQuery.of(context).size.width < 441
                            ? 2
                            : MediaQuery.of(context).size.width < 600
                                ? 3
                                : 4,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    childAspectRatio: 0.5,
                    children: snapshot.data!
                        .map<Widget>((e) => ProdutoTile(produto: e))
                        .toList(),
                  )),
        drawer: drawer(context));
  }

  avatar(BuildContext context, {Function()? onPress, double? tamanho}) {
    return IconButton(
      iconSize: tamanho != null ? tamanho : 40,
      icon: Container(
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: (widget.appStore.identificado?.foto ?? "") == ""
            ? Icon(
                Icons.person,
                shadows: kElevationToShadow[1],
                color: Colors.grey[600],
              )
            : Image.network(widget.appStore.identificado!.foto!),
      ),
      onPressed: onPress,
    );
  }

  drawer(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        Card(
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(children: [
                    avatar(context, tamanho: 100),
                    Text(
                      widget.appStore.identificado?.nome ?? "",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      widget.appStore.identificado?.email ?? "",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500),
                    )
                  ]),
                  Positioned(
                    right: -5,
                    top: -5,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/perfil");
                        },
                        icon: Icon(
                          shadows: kElevationToShadow[1],
                          Icons.settings_rounded,
                          color: Color.fromARGB(255, 253, 253, 253),
                        )),
                  ),
                ],
              ),
            )),
      ]),
    );
  }
}
