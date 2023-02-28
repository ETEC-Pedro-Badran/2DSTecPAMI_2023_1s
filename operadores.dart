void printInteger(int numero, String titulo){
  print("O número é $numero operador: $titulo");
}

void main(){
  print("Progama iniciado");
  int num1 = 12;
  var num2  = 5;
/*  print("Operadores de aritméticos");
  printInteger(num1 * num2, "multiplicação");
  printInteger((num1 / num2).floor(), 'divisão');
  printInteger(num1 - num2, 'subtração');
  printInteger(num1 + num2, 'adição');
  printInteger(num1 % num2,'resto');
  printInteger(num1, 'Valor Num1');
  printInteger(++num1,"Incremento antes");
  printInteger(num1++,"Incremento depois");
  printInteger(num1, 'Valor Num1');
  printInteger(--num1,"Decremento antes");
  printInteger(num1--,"Decremento depois");
  printInteger(num1, 'Valor Num1');
  print("Operadores de comparação");
  print("Igualdade ${num1==num2}");
  print("Diferença ${num1!=num2}");
  print("Maior ${num1>num2}");
  print("Menor ${num1<num2}");
  print("Maior ou igual ${num1>=num2}");
  print("Menor ou igual ${num1<=num2}");
  print("Operadores Lógicos");
  print("Operador E ${true && true}");
  print("Operador E ${true && false}");
  print("Operador E ${false && false}");
  print("Operador Ou ${true || true}");
  print("Operador Ou ${true || false}");
  print("Operador Ou ${false || false}");
  print("Operador XOR ${true ^ true}");
  print("Operador XOR ${true ^ false}");
  print("Operador XOR ${false ^ false}");
  print("Operador ternário");
  var idade = 18;
  //estrutura condicional
  if (idade >= 18) {
    print("Maior");
  } else {
    print("Menor");
  }
  print(idade>=18?"Maior":"Menor");
  
  /*? ?? são operadores null-safety*/
  String? nome;
  print(nome??"Valor se nullo");
  */
   //operador spread 
  var lista= ['A','B','C'];
  var listaB = ['D','E','F'];
  var listaCompleta = [...lista, ...listaB];
  print(listaCompleta);
  
  listaCompleta..removeLast()..removeLast()..removeLast()..removeLast();
  print(listaCompleta);
  
  print(DateTime.now().millisecondsSinceEpoch);
  
}