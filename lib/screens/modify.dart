import 'package:flutter/material.dart';
import 'package:todolist/models/Task_obj.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/database.dart';

class Modifytask extends StatefulWidget {
  Function(String?) callback;
  String name;
  Modifytask(this.callback,this.name);

  @override
  State<Modifytask> createState() => _ModifytaskState();
}

class _ModifytaskState extends State<Modifytask> {
  TextEditingController? _controller;
  void initState(){
    super.initState();
    _controller = new TextEditingController(text: widget.name);
  }
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
                  child: Text('Modify Task',
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
                      controller: _controller,
                      textAlign: TextAlign.center,
                      autofocus: true,
                      decoration: InputDecoration(
                          labelText: 'Enter a Task',
                          labelStyle: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontFamily: 'Source Sans Pro',
                          ),
                          floatingLabelStyle: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontFamily: 'Source Sans Pro',
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
                              'Modify',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Source Sans Pro',
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
