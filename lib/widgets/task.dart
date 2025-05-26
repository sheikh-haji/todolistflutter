import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/screens/modify.dart';
import 'package:todolist/models/items.dart';
import 'package:todolist/models/database.dart';

class task extends StatefulWidget {

  final bool? ischecked;
  final String? TaskTitle;
  final void Function(bool?)? callback;
  final void Function() longcallback;
  Item grocery;
  task(this.TaskTitle,this.ischecked,this.callback,this.longcallback,this.grocery);

  @override
  State<task> createState() => _taskState();
}

class _taskState extends State<task> {
  String task='';
  int l=0;
  void func()async {
    var l1=await Provider.of<DatabaseHelper>(context).length();
    setState((){
      l=l1;
    });


  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.0, top:5.0,right: 10,bottom:3.0),
      child: ListTile(
        visualDensity: VisualDensity(horizontal: -4.0, vertical: 0),
        // onTap: ()async{
        //   showModalBottomSheet(
        //       context: context,
        //       isScrollControlled: true,
        //       builder: (context) {
        //         return Modifytask((String? newvalue)async{
        //           String? task1=newvalue;
        //           print(task1);
        //           task=(task1==null)?'':task1;
        //           await Provider.of<DatabaseHelper>(context).modifytask(widget.grocery,task);
        //         });
        //       });
        //
        // },
        // shape:ShapeBorder.lerp(a, b, 0.0),
          onLongPress:widget.longcallback,
        title: TextButton(
          onPressed:()async{
            await showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return Modifytask((String? newvalue)async{
                    String? task1=newvalue;
                    print(task1);
                    task=(task1==null)?'':task1;
                  },widget.grocery.name);
                });
            // setState(() {
               if(task!=''){
                 await Provider.of<DatabaseHelper>(context,listen: false).modifytask(widget.grocery, task);
                 func();}

              // });

          },
          child:SizedBox(
            width: double.infinity,
            child: Text(widget.TaskTitle.toString()==null?'':widget.TaskTitle.toString(),
              textAlign: TextAlign.left,

              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color:Colors.black,
                fontSize: 20,
                decorationThickness:(widget.ischecked==true)?4.0:0.0,
                decoration: (widget.ischecked==true)?TextDecoration.lineThrough:null,
                decorationColor: (widget.ischecked==true)?Colors.lightBlueAccent:null,
// decorationStyle: (ischecked==true)?TextDecorationStyle.solid:null,
              ),
            ),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children:<Widget>[ Checkbox(
            value: widget.ischecked,
            onChanged: widget.callback,
          ),
            TextButton(
              onPressed: widget.longcallback,
              // child:Container(),
              child: Icon(
                Icons.delete_outline_outlined,
                color: Colors.red,
                size: 25.0,
              ),
            ),
        ]
        ),
      ),
    );
  }
}


// class checkbox extends StatelessWidget{
//   final bool? isChecked ;
//   final void Function(bool?)? func;
//   checkbox({this.isChecked,this.func});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Checkbox(
//       activeColor: Colors.lightBlueAccent,
//       // hoverColor:Colors.lightBlueAccent,
//       value: isChecked,
//       onChanged: func,
//     );
//   }
// }
