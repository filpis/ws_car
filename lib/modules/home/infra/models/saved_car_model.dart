import 'dart:convert';

class SaveBuyModel {
  List<SavedCarModel> cars;
  SaveBuyModel({required this.cars});

  Map<String, dynamic> toMap() {
    return {
      'cars': cars.map((x) => x.toMap()).toList(),
    };
  }

  factory SaveBuyModel.fromMap(Map<String, dynamic> map) {
    return SaveBuyModel(
      cars: List<SavedCarModel>.from(
        map['cars'].map(
          (x) => SavedCarModel.fromJson(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SaveBuyModel.fromJson(String source) =>
      SaveBuyModel.fromMap(json.decode(source));
}

class SavedCarModel {
  int? id;
  DateTime? timestampCadastro;
  int? modeloId;
  int? ano;
  String? combustivel;
  int? numPortas;
  String? cor;
  String? nomeModelo;
  double? valor;
  DateTime? date;
  String? email;

  SavedCarModel({
    this.id,
    this.timestampCadastro,
    this.modeloId,
    this.ano,
    this.combustivel,
    this.numPortas,
    this.cor,
    this.nomeModelo,
    this.valor,
    this.date,
    this.email,
  });

  SavedCarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timestampCadastro = json['timestampCadastro'] != null
        ? DateTime.fromMillisecondsSinceEpoch(json['timestampCadastro'])
        : null;
    modeloId = json['modeloId'];
    ano = json['ano'];
    combustivel = json['combustivel'];
    numPortas = json['numPortas'];
    cor = json['cor'];
    nomeModelo = json['nomeModelo'];
    valor = json['valor'] is double
        ? json['valor']
        : double.tryParse(json['valor'].toString());
    email = json['email'];
    date = json['date'] != null
        ? DateTime.fromMillisecondsSinceEpoch(json['date'])
        : null;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'timestampCadastro': timestampCadastro?.millisecondsSinceEpoch,
      'modeloId': modeloId,
      'ano': ano,
      'combustivel': combustivel,
      'numPortas': numPortas,
      'cor': cor,
      'nomeModelo': nomeModelo,
      'valor': valor,
      'date': date?.millisecondsSinceEpoch,
      'email': email,
    };
  }
}
