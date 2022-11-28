import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:half_task/pages/add_task_page.dart';
import 'package:half_task/pages/home_page.dart';
import 'package:half_task/providers/todo_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MyApp(),
    ),
  );
}

final router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => HomePage(),
  ),
  GoRoute(
    path: "/add",
    builder: (context, state) => AddTodoPage(),
  ),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: router,
      ),
    );
  }
}
