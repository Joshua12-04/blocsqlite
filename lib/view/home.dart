import 'package:blocsqlite/view/studentlist.dart';
import 'package:blocsqlite/view/widgetform.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Los croods"), elevation: 4),
      body: const Studentlist(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Widgetform.show(context),
        child: Icon(Icons.add_reaction_outlined),
      ),
    );
  }
}
