// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bloc_todo/models/task_model.dart';
import 'package:equatable/equatable.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState(allTask: const [])) {
    // on<TaskEvent>((event, emit) {
    //   if (event is AddTask) {
    //     _onAddTask;
    //   } else if (event is DeleteTask) {
    //     _onDeleteTask;
    //   } else if (event is UpDateTask) {
    //     _onUpDateTask;
    //   }
    // });
    on<AddTask>(_onAddTask);
    on<DeleteTask>(_onDeleteTask);
    on<UpDateTask>(_onUpDateTask);
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(allTask: List.from(state.allTask)..add(event.task)));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(allTask: List.from(state.allTask)..remove(event.task)));
  }

  void _onUpDateTask(UpDateTask event, Emitter<TaskState> emit) {}
}
