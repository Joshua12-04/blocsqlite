import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/studentmodel.dart';


abstract class StudentEvent extends Equatable {
  const StudentEvent();

  @override
  List<Object> get props => [];
}

class CreateStudent extends StudentEvent {
  final Student? student;

  const CreateStudent(this.student);

  @override
  List<Object> get props => [student!];
}

class ReadStudent extends StudentEvent {
  @override
  List<Object> get props => [];
}

class UpdateStudent extends StudentEvent {
  final Student? student;

  const UpdateStudent(this.student);

  @override
  List<Object> get props => [student!];
}

class DeleteStudent extends StudentEvent {
  final int? id;

  const DeleteStudent(this.id);

  @override
  List<Object> get props => [id!];
}