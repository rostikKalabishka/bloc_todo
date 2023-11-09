import 'package:bloc_todo/blocs/bloc/task_bloc.dart';
import 'package:bloc_todo/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class TaskListWidget extends StatelessWidget {
  const TaskListWidget(
      {required this.taskList,
      // this.onPressed,
      super.key});
  // VoidCallback? onPressed;
  final List<Task> taskList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(taskList[index].title),
              trailing: IconButton(
                icon: const Icon(
                  Icons.remove,
                  color: Colors.red,
                ),
                onPressed: () {
                  context
                      .read<TaskBloc>()
                      .add(DeleteTask(task: taskList[index]));
                },
              ),
              leading: Checkbox(
                value: taskList[index].isDone,
                onChanged: (value) {
                  context
                      .read<TaskBloc>()
                      .add(UpDateTask(task: taskList[index]));
                },
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
                // color: Colors.deepPurple,
                );
          },
          itemCount: taskList.length),
    );
  }
}
