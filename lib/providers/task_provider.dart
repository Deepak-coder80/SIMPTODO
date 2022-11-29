import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:simptodo/database/database_helper.dart';
import '../models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _items = [];

  get itemCount {
    fetchAndSetPlace();
    return _items.length;
  }

  Future<void> fetchAndSetPlace() async {
    final dataList = await DBHelper.getData('todos');
    _items = dataList
        .map((item) => Task(
              title: item['title'],
              isDone: item['isDone']==1?true:false,
            ))
        .toList();
    notifyListeners();
  }

  List<Task> get tasks {
    fetchAndSetPlace();
    return [..._items];
  }

  void addTask(String title) {
    final newTask = Task(
      title: title,
      isDone: false,
    );
    _items.add(newTask);

    DBHelper.insert('todos', {
      'title': newTask.title,
      'isDone': newTask.isDone==true ? 1 : 0,
    });
    notifyListeners();
  }

  void deleteTask(int index) {
    _items.removeAt(index);

    notifyListeners();
  }
}
