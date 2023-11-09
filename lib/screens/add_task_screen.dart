import 'package:flutter/material.dart';

void addTask(BuildContext context) {
  final TextEditingController titleController = TextEditingController();
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextFormField(
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
                          onPressed: () {}, child: const Text('Add Task'))
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
