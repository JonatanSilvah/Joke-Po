import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _escolhaApp = [
    "images/papel.png",
    "images/pedra.png",
    "images/tesoura.png"
  ];
  String _escolhaUser = "";
  String _resultado = "";
  String app = "images/padrao.png";
  int _qdtWins = 0;
  int _qtdLose = 0;
  int _qtdEmpate = 0;

  void vencedor() {
    int escolhaApp = Random().nextInt(_escolhaApp.length);
    setState(() {
      app = _escolhaApp[escolhaApp];
      if (_escolhaUser == app) {
        _resultado = "Empate";
        _qtdEmpate += 1;
      } else if (_escolhaUser == "images/papel.png" &&
              app == "images/pedra.png" ||
          _escolhaUser == "images/pedra.png" && app == "images/tesoura.png" ||
          _escolhaUser == "images/tesoura.png" && app == "images/papel.png") {
        _resultado = "Você venceu :)";
        _qdtWins += 1;
      } else {
        _resultado = "Você perdeu :(";
        _qtdLose += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("JokenPo"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                  "Escolha do APP:",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              Image.asset(
                app,
                height: 90,
              ),
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                  "Resultado: $_resultado",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      _escolhaUser = "images/papel.png";
                      vencedor();
                    },
                    child: Image.asset(
                      "images/papel.png",
                      height: 90,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _escolhaUser = "images/pedra.png";
                      vencedor();
                    },
                    child: Image.asset(
                      "images/pedra.png",
                      height: 90,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _escolhaUser = "images/tesoura.png";
                      vencedor();
                    },
                    child: Image.asset(
                      "images/tesoura.png",
                      height: 90,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                  "Historico:",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  "Vitorias: $_qdtWins",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  "Derrotas: $_qtdLose",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Text("Empates: $_qtdEmpate")
            ],
          ),
        ));
  }
}
