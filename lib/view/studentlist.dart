import 'package:blocsqlite/bloc/studentbloc.dart';
import 'package:blocsqlite/state/studentstate.dart';
import 'package:blocsqlite/view/widgetemptylist.dart';
import 'package:blocsqlite/view/widgeterror.dart';
import 'package:blocsqlite/view/widgetfilledlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Studentlist extends StatelessWidget {
  const Studentlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentBloc, StudentState>(
      builder: (context, state) {
        if (state is StudentInitial || state is StudentLoading) {
          return CircularProgressIndicator();
        }

        if (state is StudentError) {
          // downcasting
          //final error = state;
          return Widgeterror(message: state.message);
        }
        if (state is StudentLoaded) {
          if (state.students == null) {
            return Widgetemptylist();
          }
          else {
            if (state.students!.isEmpty){
              return Widgetemptylist();
            }
            else {
              return Widgetfilledlist(students: state.students);
            }
          }
        }

        return Container();
      },
    );
  }
}
