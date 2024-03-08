import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ws_car/core/utils/constants.dart';
import 'package:ws_car/core/local_storage/local_storage.dart';
import 'package:ws_car/modules/home/infra/models/car_model.dart';
import 'package:ws_car/modules/home/infra/models/saved_car_model.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.car});
  final CarModel car;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  LocalStorage localStorage = LocalStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Modular.to.pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF160e3b),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                "${Assets.cars}/${widget.car.nomeModelo}.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Modelo: ",
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 18),
                      ),
                      Text(
                        widget.car.nomeModelo ?? "",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Combustível: ",
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 18),
                      ),
                      Text(
                        widget.car.combustivel ?? "",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Quantidade de portas: ",
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 18),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        widget.car.numPortas.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Cor: ${widget.car.cor}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Valor: ",
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 18),
                      ),
                      Text(
                        formatarValorReal(widget.car.valor),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Observer(builder: (context) {
              return TextButton(
                onPressed: () async {
                  await localStorage.saveBuy(SaveBuyModel(
                    cars: [
                      SavedCarModel(
                        ano: widget.car.ano,
                        date: DateTime.now(),
                        numPortas: widget.car.numPortas,
                        modeloId: widget.car.id,
                        nomeModelo: widget.car.nomeModelo,
                        email: _auth.currentUser?.email,
                        valor: widget.car.valor,
                        timestampCadastro: DateTime.fromMillisecondsSinceEpoch(
                            widget.car.timestampCadastro!),
                        id: widget.car.id,
                        combustivel: widget.car.combustivel,
                        cor: widget.car.cor,
                      )
                    ],
                  ));
                  Fluttertoast.showToast(
                    msg: "Pedido feito!",
                    backgroundColor: Colors.green,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF0c062b),
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: const Center(
                    child: Text(
                      "Eu quero!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

String formatarValorReal(double? valor) {
  if (valor != null) {
    String valorString = valor.toStringAsFixed(3);

    return 'R\$ $valorString,00';
  } else {
    return "";
  }
}
