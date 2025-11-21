import 'package:blocsqlite/bloc/studentbloc.dart';
import 'package:blocsqlite/event/studentevent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Widgeterror extends StatelessWidget {
  final String? message;

  const Widgeterror({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<StudentBloc>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, size: 40, color: Colors.red),
          SizedBox(height: 10),
          Text(
            message!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 10),
          CupertinoButton.filled(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            color: CupertinoColors.systemYellow,
            onPressed: () {
              bloc.add(ReadStudent());
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
