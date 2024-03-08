import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ws_car/core/utils/constants.dart';
import 'package:ws_car/core/local_storage/local_storage.dart';
import 'package:ws_car/modules/access/login/login_store.dart';
import 'package:ws_car/modules/home/components/car_card_widget.dart';
import 'package:ws_car/modules/home/pages/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();
  final loginStore = Modular.get<LoginStore>();
  LocalStorage database = LocalStorage();

  @override
  void initState() {
    super.initState();

    store.getCars();
    LocalStorage().initDb();
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SvgPicture.asset(
                  width: 40,
                  "${Assets.images}/ws_logo.svg",
                ),
              ),
            ),
          ],
        ),
        body: Observer(builder: (context) {
          if (store.state == HomeState.loading) {
            return const Center(
              child: SizedBox(
                  height: 20, width: 20, child: CircularProgressIndicator()),
            );
          } else if (store.state == HomeState.success) {
            return Container(
              color: Colors.white,
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: store.cars?.length ?? 0,
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      return CarCardWidget(car: store.cars![index]);
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                    ),
                  ),
                ],
              ),
            );
          }

          return const Text("Erro");
        }));
  }
}
