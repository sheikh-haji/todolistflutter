import 'package:flutter/material.dart';
import 'package:todolist/models/Task_obj.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/database.dart';

class Addtask extends StatefulWidget {
  Function(String?) callback;

  Addtask(this.callback);

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  @override
  Widget build(BuildContext context) {
    String task = '';
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          color: Color(0xff757575),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0)),
              color: Colors.white,
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text('Add Task',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 35,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: TextField(
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                      ),
                      textAlign: TextAlign.center,
                      autofocus: true,
                      decoration: InputDecoration(
                          labelText: 'Enter a Task',
                          labelStyle: TextStyle(
                            color: Colors.lightBlueAccent,
                          ),
                          floatingLabelStyle: TextStyle(
                            color: Colors.lightBlueAccent,
                          )),
                      onChanged: widget.callback),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    // color: Colors.lightBlueAccent,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightBlueAccent),
                    ),
                    onPressed: () {
                      //
                      Navigator.pop(context);
                    },
                    child: Container(
                        width: 100,
                        height: 35,
                        color: Colors.lightBlueAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: Text(
                              'Add',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
