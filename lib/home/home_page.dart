import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_car/home/home_store.dart';

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
    return Scaffold(body: Observer(builder: (context) {
      if (store.state == HomeState.loading) {
        return const Center(
          child: SizedBox(
              height: 20, width: 20, child: CircularProgressIndicator()),
        );
      } else if (store.state == HomeState.success) {
        return ListView.builder(
          itemCount: store.cars?.length ?? 0,
          itemBuilder: (context, index) {
            return Text(store.cars?[index].cor ?? "");
          },
        );
      }

      return const Text("Erro uai");
    }));
  }
}
