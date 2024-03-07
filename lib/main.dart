import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_car/core/utils/local_storage/local_storage.dart';
import 'package:ws_car/modules/home/infra/car_model.dart';
import 'app_module.dart';
import 'app_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    await Firebase.initializeApp();
    var uuid = const Uuid();
    String taskId = uuid.v4();
    switch (task) {
      case "sendBuyCar":
        logTaskStart(taskId);
        LocalStorage ls = LocalStorage.instance;
        List<CarModel> carros = await ls.getBuy();
        if (carros.isNotEmpty) {
          await enviarDados(carros);
        } else {
          log("Nenhum dado para enviar");
        }
        logTaskComplete(taskId);
        break;
    }

    return Future.value(true);
  });
}

Future<void> enviarDados(List<CarModel> carros) async {
  Dio dio = Dio();

  for (var carro in carros) {
    var response = await dio.post(
      "",
    );

    if (response.statusCode == 200) {
      log("Dados enviados com sucesso: $carro");
    } else {
      log("Falha ao enviar dados: $response");
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCA3KJ8r1k_Tfw6zjM_dNOjOZBomOPjDu8",
      appId: "1:233894875805:android:4e9df091b40fdcacab3a74",
      messagingSenderId: "233894875805",
      projectId: "wswork-bfdd2",
    ),
  );

  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );

  Workmanager().registerPeriodicTask(
    "uniqueName",
    "sendBuyCar",
    frequency: const Duration(minutes: 15),
  );

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

void logTaskStart(String taskId) {
  FirebaseFirestore.instance.collection('taskLogs').doc(taskId).set({
    'status': 'started',
    'startTime': FieldValue.serverTimestamp(),
  });
}

void logTaskComplete(String taskId) {
  FirebaseFirestore.instance.collection('taskLogs').doc(taskId).update({
    'status': 'completed',
    'endTime': FieldValue.serverTimestamp(),
  });
}
