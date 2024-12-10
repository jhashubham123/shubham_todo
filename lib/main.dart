import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/pages/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/todo_provider.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('todoBox');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoProvider>(
            create: (context) => TodoProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const DashBoardScreen(),
      ),
    );
  }
}
