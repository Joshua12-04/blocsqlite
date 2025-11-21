import 'package:blocsqlite/bloc/studentbloc.dart';
import 'package:blocsqlite/model/studentmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

class Widgetfilledlist extends StatelessWidget {
  final List<Student>? students;

  const Widgetfilledlist({Key? key, this.students}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<StudentBloc>();
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: students?.length,
        prototypeItem: ListTile(
          title: Text(students!.first.name!),
          subtitle: Text(students!.first.age!.toString()),
        ),
        itemBuilder: (context, index) => Expanded(
          child: Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.face),
                  title: Text(students![index].name!),
                  subtitle: Text("Edad: ${students![index].age!}"),
                ),
                Wrap(
                  spacing: 10,
                  children: <Widget>[
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    SizedBox(width: 10),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
