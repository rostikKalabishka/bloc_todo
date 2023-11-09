import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/task_bloc.dart';
import '../widgets/task_list_widget.dart';
import 'add_task_screen.dart';

// ignore: must_be_immutable
class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
            return TaskListWidget(
              taskList: state.allTask,
            );
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addTask(context),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
