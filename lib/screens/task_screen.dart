import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/task_bloc.dart';
import '../widgets/task_list_widget.dart';
import 'add_task_screen.dart';

// ignore: must_be_immutable
class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  void addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddTaskScreen()),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Tasks App'),
          actions: [
            IconButton(
              onPressed: () => addTask(context),
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Chip(
                label: Text(
                  'Tasks:',
                ),
              ),
            ),
            TaskListWidget(
              taskList: state.allTask,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => addTask(context),
          tooltip: 'Add Task',
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
