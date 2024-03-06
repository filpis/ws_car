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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['timestamp_cadastro'] = this.timestampCadastro;
    data['modelo_id'] = this.modeloId;
    data['ano'] = this.ano;
    data['combustivel'] = this.combustivel;
    data['num_portas'] = this.numPortas;
    data['cor'] = this.cor;
    data['nome_modelo'] = this.nomeModelo;
    data['valor'] = this.valor;
    return data;
  }
}
