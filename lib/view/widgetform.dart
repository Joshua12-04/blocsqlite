import 'package:blocsqlite/event/studentevent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/studentbloc.dart';
import '../model/studentmodel.dart';

class Widgetform {
  static void show(BuildContext context) async {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController ageController = TextEditingController();
    final bloc = context.read<StudentBloc>();

    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Agregar Estudiante'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: TextField(
                  obscureText: false,
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nombre",
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  controller: ageController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Edad",
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
            CupertinoButton.filled(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              color: CupertinoColors.systemYellow,
              onPressed: () {
                if (nameController.text.isNotEmpty ||
                    ageController.text.isNotEmpty) {
                  bloc.add(
                    CreateStudent(
                      Student(
                        name: nameController.text,
                        age: int.tryParse(ageController.text) ?? 0,
                      ),
                    ),
                  );
                  Navigator.of(dialogContext).pop(); // dismiss el dialog
                } else {
                  Navigator.of(dialogContext).pop(); // dismiss el dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Los campos no debe de ser vacios")),
                  );
                }
              },
              child: Text("Agregar"),
            ),
          ],
        );
      },
    );
  }
}
