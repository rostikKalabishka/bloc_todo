part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> allTask;
  TaskState({this.allTask = const <Task>[]});

  @override
  List<Object> get props => [allTask];
}
