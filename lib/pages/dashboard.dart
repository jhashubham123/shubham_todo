import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/todo_provider.dart';
import 'package:todo/utils/dialog_box.dart';
import 'package:todo/utils/todo_tile.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  var todoProvider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      todoProvider = context.read<TodoProvider>();
      if (todoProvider.todoList.isEmpty) {
        todoProvider.createInitialData();
      } else {
        todoProvider.loadData;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(builder: (context, todoProvider, child) {
      return Scaffold(
          backgroundColor: Colors.yellow[200],
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.yellow,
              child: const Icon(Icons.add),
              onPressed: () {
                /// Dialoge box to create task
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DialogBox(
                        controller: todoProvider.titleController,
                        onSave: () {
                          todoProvider.createNewTask();
                          Navigator.pop(context);
                        },
                        onCancel: () {
                          todoProvider.titleController.clear();
                          Navigator.pop(context);
                        },
                      );
                    });
              }),
          appBar: AppBar(
            title: const Text('TO DO'),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.yellow,
          ),
          body: todoProvider.todoList.isEmpty
              ? const Center(child: Text('No TODO\'s saved yet'))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: todoProvider.todoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TodoTile(
                      taskName: todoProvider.todoList[index][0],
                      isTaskComplete: todoProvider.todoList[index][1],
                      onChanged: (value) =>
                          todoProvider.completeTask(value, index),
                      onTap: () {
                        todoProvider.deleteTask(index);
                      },
                    );
                  }));
    });
  }
}
