import 'package:flutter/material.dart';
import 'package:inventarioapp/data/task_inherited.dart';
import 'package:inventarioapp/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  //Informações que estou recebendo
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  // bool opacidade = true; //Estado que estou alterando

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela Principal')),
      body: ListView(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        children: TaskInherited.of(context).taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (contextNew) => FormScreen(taskContext: context)),
          );
        },
        backgroundColor: Colors.blue[100],
        child: Icon(Icons.add),
      ),
    );
  }
}
