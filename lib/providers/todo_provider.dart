import 'package:flutter/material.dart';
import 'package:half_task/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoModel> todos = [
    TodoModel(text: "Define provider class", iscompleted: false),
    TodoModel(text: "Provide/Configure the provider", iscompleted: false),
    TodoModel(
        text: "watch/read provider variables/function", iscompleted: false),
  ];

  void addTodo(String todo) {
    TodoModel model = TodoModel(
      text: todo,
      iscompleted: false,
    );
    todos.add(model);
    notifyListeners();
  }

  void updateTodo(int index) {
    todos[index].iscompleted = !todos[index].iscompleted;
    notifyListeners();
  }

  void removeTodoAt(int index) {
    todos.removeAt(index);
    notifyListeners();
  }
}
