import 'package:blocsqlite/event/studentevent.dart';
import 'package:blocsqlite/service/databasehelper.dart';
import 'package:blocsqlite/view/studentlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/studentbloc.dart';
import 'home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "imcgroot",
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.blue,
        appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
      ),
      home: BlocProvider(
        create: (context) {
          final bloc = StudentBloc(DatabaseHelper.instance);
          bloc.add(ReadStudent());
          return bloc;
        },
        child: const Home(),
      ),
    );
  }
} // end class
