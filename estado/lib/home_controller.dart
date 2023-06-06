import 'package:estado/home_store.dart';

class HomeController {
  final HomeStore store;
  HomeController({required this.store});
  incrementar(){
     store.cliques.value++;
     store.lista.value = [store.cliques.value,
     ...store.lista.value];
     print(store.cliques.value);
  }
}