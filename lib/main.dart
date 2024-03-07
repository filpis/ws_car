import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_car/app_module.dart';
import 'package:ws_car/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyCA3KJ8r1k_Tfw6zjM_dNOjOZBomOPjDu8",
            appId: "1:233894875805:android:4e9df091b40fdcacab3a74",
            messagingSenderId: "233894875805",
            projectId: "wswork-bfdd2",
          ),
        )
      : await Firebase.initializeApp();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
