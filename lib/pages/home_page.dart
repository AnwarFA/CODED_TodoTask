import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:half_task/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "The Todo List ..",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                context.push("/add");
              },
              icon: Icon(Icons.add_box_outlined))
        ],
      ),
      body: ListView.builder(
        itemCount: context.watch<TodoProvider>().todos.length,
        itemBuilder: (context, index) => Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Checkbox(
                  value: context.watch<TodoProvider>().todos[index].iscompleted,
                  onChanged: ((value) {
                    context.read<TodoProvider>().updateTodo(index);
                  }),
                ),
                Text(context.watch<TodoProvider>().todos[index].text),
                Spacer(),
                if (!context.read<TodoProvider>().todos[index].iscompleted)
                  IconButton(
                      onPressed: null,
                      icon: Icon(Icons.delete_forever_outlined))
                else
                  IconButton(
                      onPressed: () {
                        var delete = context.read<TodoProvider>();
                        delete.removeTodoAt(index);
                      },
                      icon: Icon(Icons.delete)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
