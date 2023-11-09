part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TaskEvent {
  final Task task;

  const AddTask({required this.task});
  @override
  List<Object> get props => [task];
}

class DeleteTask extends TaskEvent {
  final Task task;

  const DeleteTask({required this.task});
  @override
  List<Object> get props => [task];
}

class UpDateTask extends TaskEvent {
  final Task task;

  const UpDateTask({required this.task});
  @override
  List<Object> get props => [task];
}
