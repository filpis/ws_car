import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:ws_car/modules/home/infra/car_model.dart';
import 'package:ws_car/modules/home/pages/product_page.dart';

class CarCardWidget extends StatelessWidget {
  const CarCardWidget({super.key, required this.car});

  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed(
          "product",
          arguments: {"car": car},
        );
      },
      child: Container(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  car.nomeModelo ?? "",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              car.combustivel ?? "",
              style: const TextStyle(fontSize: 12),
            ),
            Text(
              formatarValorReal(car.valor),
              style: const TextStyle(fontSize: 14),
            ),
            Expanded(
              child: Image.network(
                "https://www.tudodesenhos.com/uploads/images/2939/carro-de-4-portas.jpg",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      size: 15,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      car.ano.toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.door_sliding,
                      size: 15,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      car.numPortas.toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Cor: ${car.cor}",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
