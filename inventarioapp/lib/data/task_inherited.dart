import 'package:flutter/material.dart';
import 'package:inventarioapp/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required super.child});

  final List<Task> taskList = [
    Task('Aprender Flutter', 'assets/images/flutter.png', 5),
    Task('Ler', 'assets/images/ler.jpg', 1),
    Task('Andar de Bike', 'assets/images/bike.webp', 2),
  ];

  void newTask(String name, String photo, int difficulty){
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  //notifica quando a lista sofrer alguma alteração
  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
