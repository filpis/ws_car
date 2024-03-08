import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_car/core/utils/car_characteristics.dart';
import 'package:ws_car/core/utils/constants.dart';

import 'package:ws_car/modules/home/infra/models/car_model.dart';
import 'package:ws_car/modules/home/pages/product_page.dart';

class CarCardWidget extends StatelessWidget {
  const CarCardWidget({super.key, required this.car});
  final CarModel car;

  @override
  Widget build(BuildContext context) {
    CarCharacteristics carCharacteristics = CarCharacteristics();

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
            const SizedBox(
              height: 3,
            ),
            Expanded(
              child: Image.asset(
                "${Assets.cars}/${car.nomeModelo}.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 5,
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
                    const Text(
                      "Cor:",
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                          color: carCharacteristics.getColor(car.cor!),
                          borderRadius: BorderRadius.circular(10)),
                    )
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
