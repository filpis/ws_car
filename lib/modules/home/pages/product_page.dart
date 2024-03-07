import 'package:flutter/material.dart';
import 'package:ws_car/modules/home/infra/car_model.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.car});
  final CarModel car;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(widget.car.cor ?? ""),
        ),
      ),
    );
  }
}
