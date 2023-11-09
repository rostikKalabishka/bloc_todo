import 'package:bloc_todo/models/task_model.dart';
import 'package:flutter/material.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({required this.taskList, super.key});

  final List<Task> taskList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(taskList[index].title),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.deepPurple,
            );
          },
          itemCount: taskList.length),
    );
  }
}
