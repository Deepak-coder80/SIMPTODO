import 'dart:collection';

import 'package:flutter/material.dart';
import '../models/task_model.dart';
class TaskProvider extends ChangeNotifier{
  List<Task> _dummyData = [
    Task(title: 'Complete this project', isDone: false),
    Task(title: 'Have meals', isDone: false),
    Task(title: 'Study MP', isDone: false),
    Task(title: 'Study CG', isDone: false),
  ];

  get itemCount{
    return _dummyData.length;
  }

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_dummyData);
  }

  void addTask(String title){
    _dummyData.add(Task(title: title,isDone: false));
    notifyListeners();
  }

  void deleteTask(int index){
    _dummyData.removeAt(index);

    notifyListeners();
  }

}