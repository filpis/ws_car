import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqflite/sqflite.dart';
import 'package:workmanager/workmanager.dart';
import 'package:ws_car/core/tasks_monitoring/tasks_monitoring.dart';
import 'package:ws_car/core/utils/local_storage/local_storage.dart';
import 'package:ws_car/modules/home/components/car_card_widget.dart';
import 'package:ws_car/modules/home/pages/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();
  LocalStorage database = LocalStorage();

  @override
  void initState() {
    super.initState();

    store.getCars();
    _init();
  }

  _init() async {
    await LocalStorage.instance.initDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF160e3b),
          automaticallyImplyLeading: false,
          actions: [
            GestureDetector(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.only(right: 14),
                child: Icon(
                  Icons.shopping_bag,
                  color: Color(0xFFefba39),
                  size: 35,
                ),
              ),
            )
          ],
        ),
        body: Observer(builder: (context) {
          if (store.state == HomeState.loading) {
            return const Center(
              child: SizedBox(
                  height: 20, width: 20, child: CircularProgressIndicator()),
            );
          } else if (store.state == HomeState.success) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: store.cars?.length ?? 0,
                  primary: false,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    return CarCardWidget(car: store.cars![index]);
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                ),
              ],
            );
          }

          return const Text("Erro");
        }));
  }
}
