import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  bool? isDone;
  bool? isDelete;
  Task({
    required this.title,
    this.isDone,
    this.isDelete,
  }) {
    isDone = isDone ?? false;
    isDelete = isDelete ?? false;
  }
  @override
  List<Object?> get props => [title, isDone, isDelete];

  Task copyWith({
    String? title,
    bool? isDone,
    bool? isDelete,
  }) {
    return Task(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDelete: isDelete ?? this.isDelete,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isDone': isDone,
      'isDelete': isDelete,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDelete: map['isDelete'] != null ? map['isDelete'] as bool : null,
    );
  }
}
