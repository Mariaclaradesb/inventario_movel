import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tela Principal'),
        ),
        body: ListView(
          children: [
            Task('Aprender Flutter'),
            Task('Jogar'),
            Task('Nadar'),
            Task('Jogar'),
            Task('Jogar'),
            Task('Jogar'),
            Task('Jogar'),
            Task('Jogar'),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){}),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  const Task(this.nome,{Key? key}) : super(key: key);


  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              height: 140,
            ),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.black,
                        width: 72,
                        height: 100,
                      ),
                      Container(
                        width: 200,
                          child: Text(
                              widget.nome,
                              style: TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis))),
                      ElevatedButton(onPressed: (){
                        setState(() {
                          nivel++;
                        });
                        print(nivel);
                      }, child: Icon(Icons.arrow_drop_up))
                    ],
                  ),
                ),
                Text('Level $nivel', style: TextStyle(color: Colors.white, fontSize: 16))
              ],
            )
          ],
        ),
      ),
    );
  }
}
