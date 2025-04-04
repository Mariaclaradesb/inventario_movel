import 'package:flutter/material.dart';
import 'package:inventarioapp/components/difficulty.dart';

class Task extends StatefulWidget {
  final String nome; // informaçoes que estou usando
  final String image;
  final int dificuldade;

  Task(this.nome, this.image, this.dificuldade, {super.key});

  int nivel = 0; //Informações que estou recebendo

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blue),
          ),
          Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26
                      ),
                      width: 80,
                      height: 100,
                      child: Image(
                        image: AssetImage(widget.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: TextStyle(
                              fontSize: 24,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Difficulty(
                                dificultyLevel: widget.dificuldade),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.nivel++;
                            });
                          },
                          child: Icon(Icons.arrow_drop_up),
                        ),
                        Text('UP', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      value: widget.dificuldade > 0 ? ((widget.nivel / widget.dificuldade) / 10) : 1,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Level ${widget.nivel}',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}