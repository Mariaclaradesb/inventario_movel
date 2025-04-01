import 'package:flutter/material.dart';
import 'package:inventarioapp/task.dart';

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
        duration: Duration(milliseconds: 800),
        child: ListView(
          children: [
            Task(
                'Aprender Flutter',
                'https://storage.googleapis.com/cms-storage-bucket/780e0e64d323aad2cdd5.png',
                5
            ),
            Task('Jogar', '', 1),
            Task('Nadar', '', 2),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          opacidade = !opacidade;
        });
      },
        child: Icon(Icons.remove_red_eye),
      ),
    );
  }
}