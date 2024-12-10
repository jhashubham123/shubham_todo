import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoProvider extends ChangeNotifier {
  /// This will store title text from user input
  TextEditingController titleController = TextEditingController();

  /// Intialize empty todo list
  List todoList = [];

  /// Creating instance for my box
  final _todoBox = Hive.box('todoBox');

  /// Update checkbox
  void completeTask(bool? value, int index) {
    todoList[index][1] = !todoList[index][1];
    notifyListeners();
  }

  /// Create intial data for example
  void createInitialData() {
    todoList = [
      ["Shubham task", false],
      ["Clean room", false]
    ];
    notifyListeners();
  }

  /// Load all the saved data from hive
  void loadData() {
    todoList = _todoBox.get("TODOLIST");
    notifyListeners();
  }

  /// Create new task on click of save button
  void createNewTask() {
    todoList.add([titleController.text, false]);
    titleController.clear();
    notifyListeners();
  }

  /// delete task from List
  void deleteTask(int index) {
    todoList.removeAt(index);
    notifyListeners();
  }
}
