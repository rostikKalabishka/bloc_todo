import 'package:bloc_todo/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/task_bloc.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
                hintText: 'Add task', border: OutlineInputBorder()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                  onPressed: () {
                    var task = Task(title: titleController.text);
                    context.read<TaskBloc>().add(AddTask(task: task));

                    Navigator.of(context).pop();
                  },
                  child: const Text('Add Task'))
            ],
          ),
        ],
      ),
    );
  }
}
