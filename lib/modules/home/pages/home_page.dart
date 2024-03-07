import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_car/modules/home/components/car_card_widget.dart';
import 'package:ws_car/modules/home/pages/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();

  @override
  void initState() {
    super.initState();

    store.getCars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 10),
                child: const Icon(Icons.shopping_bag))
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
                  padding: const EdgeInsets.all(20),
                  itemBuilder: (context, index) {
                    return CarCardWidget(car: store.cars![index]);
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                ),
              ],
            );
          }

          return const Text("Erro");
        }));
  }
}
