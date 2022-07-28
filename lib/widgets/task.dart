import 'package:flutter/material.dart';

class task extends StatefulWidget {
  @override
  State<task> createState() => _taskState();
}

class _taskState extends State<task> {
  bool? ischecked=false;

  void Togglefunction(bool? newvalue){
    setState((){
      ischecked=newvalue;
    });

  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("THIS IS A WORK",
        style: TextStyle(
          // if(ischecked==true){
            decorationThickness:(ischecked==true)?4.0:0.0,
          decoration: (ischecked==true)?TextDecoration.lineThrough:null,
          decorationColor: (ischecked==true)?Colors.lightBlueAccent:null,
          // decorationStyle: (ischecked==true)?TextDecorationStyle.solid:null,
        ),
      ),
      trailing: checkbox(isChecked:ischecked,func:Togglefunction),
    );
  }
}


class checkbox extends StatelessWidget{
  final bool? isChecked ;
  final void Function(bool?)? func;
  checkbox({this.isChecked,this.func});

  @override
  Widget build(BuildContext context) {

    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      // hoverColor:Colors.lightBlueAccent,
      value: isChecked,
      onChanged: func,
    );
  }
}
