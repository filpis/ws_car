import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:ws_car/core/utils/constants.dart';
import 'package:ws_car/modules/access/singup/singup_store.dart';

class SingupPage extends StatefulWidget {
  const SingupPage({super.key});

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  final store = Modular.get<SingupStore>();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late ReactionDisposer react;

  @override
  void initState() {
    super.initState();
    reaction((_) => store.state, (SingupState state) {
      if (state == SingupState.success) {
        Fluttertoast.showToast(
          msg: "Cadastro feito com sucesso!",
          backgroundColor: Colors.green,
        );
        Modular.to.pop();
      } else if (state == SingupState.failed) {
        Fluttertoast.showToast(
          msg: "Erro ao fazer cadastro. Tente novamente mais tarde.",
          backgroundColor: Colors.red,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF160e3b),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Modular.to.pop();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                "Faça seu cadastro:",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFFA4A4A4),
                  width: 0.5,
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(
                    "${Assets.icons}/user_icon.svg",
                    fit: BoxFit.fill,
                    width: 15,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: userController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: "Usuário",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFFA4A4A4),
                  width: 0.5,
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(
                    "${Assets.icons}/key_icon.svg",
                    fit: BoxFit.fill,
                    width: 15,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: "Senha",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Observer(builder: (context) {
              return TextButton(
                onPressed: () {
                  store.singup(userController.text, passwordController.text);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF0c062b),
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: store.state == SingupState.loading
                      ? const Center(
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : const Center(
                          child: Text(
                            "Cadastrar",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
