import 'package:blocsqlite/view/widgetform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../event/studentevent.dart';

class Widgetemptylist extends StatelessWidget {
  const Widgetemptylist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.info_rounded, size: 40, color: Colors.red),
          SizedBox(height: 10),
          Text(
            "La lsita esta vacia",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 10),
          CupertinoButton.filled(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            color: CupertinoColors.systemYellow,
            onPressed: () {
              Widgetform.show(context);
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
