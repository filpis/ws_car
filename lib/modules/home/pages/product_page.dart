import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_car/core/utils/local_storage/local_storage.dart';
import 'package:ws_car/modules/home/infra/car_model.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.car});
  final CarModel car;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  LocalStorage ls = LocalStorage.instance;

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
        padding: const EdgeInsets.all(10),
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
            Center(
              child: Image.network(
                "https://www.tudodesenhos.com/uploads/images/2939/carro-de-4-portas.jpg",
                height: 250,
              ),
            ),
            Row(
              children: [
                const Text(
                  "Modelo: ",
                  style: TextStyle(fontWeight: FontWeight.w200, fontSize: 18),
                ),
                Text(
                  widget.car.nomeModelo ?? "",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  "Combustível: ",
                  style: TextStyle(fontWeight: FontWeight.w200, fontSize: 18),
                ),
                Text(
                  widget.car.combustivel ?? "",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  "Quantidade de portas: ",
                  style: TextStyle(fontWeight: FontWeight.w200, fontSize: 18),
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
              height: 20,
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
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  "Valor: ",
                  style: TextStyle(fontWeight: FontWeight.w200, fontSize: 18),
                ),
                Text(
                  formatarValorReal(widget.car.valor),
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const Spacer(),
            Observer(builder: (context) {
              return TextButton(
                onPressed: () {
                  ls.saveBuy(widget.car);
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
