import 'package:flutter/material.dart';
import '../models/task_model.dart';
class TaskProvider extends ChangeNotifier{
  List<Task> dummyData = [
    Task(title: 'Complete this project', isDone: false),
    Task(title: 'Have meals', isDone: false),
    Task(title: 'Study MP', isDone: false),
    Task(title: 'Study CG', isDone: false),
  ];


}