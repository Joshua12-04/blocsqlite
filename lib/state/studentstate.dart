import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../model/studentmodel.dart';

abstract class StudentState extends Equatable {
  @override
  List<Object> get props => [];
}

final class StudentInitial extends StudentState {}

final class StudentLoading extends StudentState {}

final class StudentLoaded extends StudentState {
  final List<Student>? students;
  final bool? order;

  StudentLoaded({this.students, this.order});

  StudentLoaded copyWidth({List<Student>? students, bool? order}) {
    return StudentLoaded(
      students: students ?? this.students,
      order: order ?? this.order,
    );
  }

  @override
  List<Object> get props => [students!, order!];
}

class StudentError extends StudentState {
  final String? message;
  StudentError({this.message});
  @override
  List<Object> get props => [message!];

}
