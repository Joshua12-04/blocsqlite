import 'package:blocsqlite/bloc/studentbloc.dart';
import 'package:blocsqlite/event/studentevent.dart';
import 'package:blocsqlite/model/studentmodel.dart';
import 'package:blocsqlite/view/widgetform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        itemBuilder: (context, index) => Card(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  trailing: Wrap(
                    spacing: 12,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          bloc.add(DeleteStudent(students![index].id));
                        },
                        icon: Icon(Icons.delete),
                      ),
                      SizedBox(width: 10),
                      IconButton(onPressed: () {
                        Widgetform.show(context, students![index]);
                      }, icon: Icon(Icons.edit)),
                    ],
                  ),
                  leading: Icon(Icons.face),
                  title: Text(students![index].name!),
                  subtitle: Text("Edad: ${students![index].age!}"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
