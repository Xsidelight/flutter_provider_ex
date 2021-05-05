import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/data/models/task_model.dart';

class TodoModel extends ChangeNotifier {
  List<Task> tasksList = [];

  addTask(String title, String detail, bool isImportant) {
    Task task = Task(title: title, detail: detail, isImportant: isImportant);
    tasksList.add(task);
    notifyListeners();
  }

  removeTask(int index) {
    tasksList.removeAt(index);
    notifyListeners();
  }
}