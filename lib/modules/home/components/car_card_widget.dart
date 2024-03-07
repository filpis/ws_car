import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_car/modules/home/infra/car_model.dart';

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
        height: 400,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(car.nomeModelo ?? ""),
          ],
        ),
      ),
    );
  }
}
