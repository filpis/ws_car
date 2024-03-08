import 'package:flutter/material.dart';

class CarCharacteristics {
  Color getColor(String valorString) {
    switch (valorString) {
      case "BEGE":
        return const Color(0xFFf5f5dc);
      case "AZUL":
        return Colors.blue.shade800;

      default:
        return Colors.white;
    }
  }
}
