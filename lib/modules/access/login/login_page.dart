import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:ws_car/core/utils/constants.dart';
import 'package:ws_car/modules/access/login/login_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final store = Modular.get<LoginStore>();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late ReactionDisposer react;

  @override
  void initState() {
    super.initState();
    reaction((_) => store.state, (LoginState state) {
      if (state == LoginState.success) {
        Modular.to.pushNamed("../home");
      } else if (state == LoginState.failed) {
        Fluttertoast.showToast(
          msg: "Conta não encontrada. Faça seu cadastro.",
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            SvgPicture.asset(
              "${Assets.images}/ws_logo.svg",
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
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
                    height: 20,
                  ),
                  Observer(builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        store.login(
                            userController.text, passwordController.text);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF0c062b),
                            border: Border.all(width: 1, color: Colors.white),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          child: Center(
                            child: store.state == LoginState.loading
                                ? const Center(
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : const Center(
                                    child: Text(
                                      "Entrar",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                  ),
                          )),
                    );
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 0.5,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "ou",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 30,
                        height: 0.5,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Observer(builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        Modular.to.pushNamed("singup");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFF0c062b),
                          border: Border.all(width: 1, color: Colors.white),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        child: const Center(
                          child: Text(
                            "Cadastro",
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
            )
          ],
        ),
      ),
    );
  }
}
