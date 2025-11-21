import 'dart:async';

import 'package:blocsqlite/service/databasehelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../event/studentevent.dart';
import '../model/studentmodel.dart';
import '../state/studentstate.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final DatabaseHelper? dbhelper;

  StudentBloc(this.dbhelper) : super(StudentInitial()) {
    on<CreateStudent>(createstudents);
    on<ReadStudent>(readstudents);
    on<UpdateStudent>(updatestudent);
    on<DeleteStudent>(deletestudent);
  }

  Future<void> readstudents(
    ReadStudent event,
    Emitter<StudentState> emit,
  ) async {
    // Consulta a las base de datos
    emit(StudentLoading());
    try {
      final students = await dbhelper?.ReadAll(); // Request
      emit(StudentLoaded(students: students));
    } catch (e) {
      emit(
        StudentError(message: "Error: No se pudo conectar a la base de datos"),
      );
    }
  }

  FutureOr<void> createstudents(
    CreateStudent event,
    Emitter<StudentState> emit,
  ) async {
    try {
      await dbhelper?.Create(event.student!);
      add(ReadStudent());
    } catch (e) {
      emit(StudentError(message: "Error: No se pudo agregar el estudiante"));
      add(ReadStudent());
    }
  }

  FutureOr<void> updatestudent(
    UpdateStudent event,
    Emitter<StudentState> emit,
  ) async {
    try {
      await dbhelper?.Update(event.student!);
      add(ReadStudent());
    } catch (e) {
      emit(StudentError(message: "Error: No se pudo actualizar el estudiante"));
      add(ReadStudent());
    }
  }

  FutureOr<void> deletestudent(
    DeleteStudent event,
    Emitter<StudentState> emit,
  ) async {
    try {
      await dbhelper?.Delete(Student(id: event.id));
      add(ReadStudent());
    } catch (e) {
      emit(StudentError(message: "Error: No se pudo eliminar el estudiante"));
      add(ReadStudent());
    }
  }
} // end class
