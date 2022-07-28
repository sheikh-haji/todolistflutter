import 'package:flutter/material.dart';
import 'package:todolist/widgets/task.dart';
class Tasklist extends StatefulWidget {
  @override
  State<Tasklist> createState() => _TasklistState();
}

class _TasklistState extends State<Tasklist> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 30.0, top: 40.0, right: 10),
      children: [
        task(),
        task(),
        task(),
        task(),
        task(),
      ],
    );
  }
}
