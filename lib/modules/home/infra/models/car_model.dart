class CarModel {
  int? id;
  int? timestampCadastro;
  int? modeloId;
  int? ano;
  String? combustivel;
  int? numPortas;
  String? cor;
  String? nomeModelo;
  double? valor;

  CarModel(
      {this.id,
      this.timestampCadastro,
      this.modeloId,
      this.ano,
      this.combustivel,
      this.numPortas,
      this.cor,
      this.nomeModelo,
      this.valor});

  CarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timestampCadastro = json['timestamp_cadastro'];
    modeloId = json['modelo_id'];
    ano = json['ano'];
    combustivel = json['combustivel'];
    numPortas = json['num_portas'];
    cor = json['cor'];
    nomeModelo = json['nome_modelo'];
    valor = json['valor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['timestamp_cadastro'] = timestampCadastro;
    data['modelo_id'] = modeloId;
    data['ano'] = ano;
    data['combustivel'] = combustivel;
    data['num_portas'] = numPortas;
    data['cor'] = cor;
    data['nome_modelo'] = nomeModelo;
    data['valor'] = valor;
    return data;
  }
}
