import 'package:flutter/material.dart';
import 'package:inventarioapp/components/task.dart';

class InitialScreen extends StatefulWidget {
  //Informações que estou recebendo
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true; //Estado que estou alterando

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela Principal')),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: Duration(milliseconds: 500),
        child: ListView(
          children: [
            Task(
                'Aprender Flutter',
                'assets/images/flutter.png',
                5
            ),
            Task('Ler', 'assets/images/ler.jpg', 1),
            Task('Andar de Bike', 'assets/images/bike.webp', 2),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          opacidade = !opacidade;
        });
      },
        backgroundColor: Colors.blue[100],
        child: Icon(Icons.remove_red_eye),
      ),
    );
  }
}