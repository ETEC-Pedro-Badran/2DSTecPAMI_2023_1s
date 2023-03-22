class Extrato {
  final String descricao;
  final double valor;
  final TipoExtrato tipo;

  Extrato(this.descricao, this.valor, this.tipo);
}

enum TipoExtrato { entrada, saida }
