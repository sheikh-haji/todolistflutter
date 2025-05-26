import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/widgets/task.dart';
import 'package:todolist/models/items.dart';
import 'package:todolist/models/database.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Tasklist extends StatefulWidget {
  void Function()? longcallback;

  Tasklist({this.longcallback});

  @override
  State<Tasklist> createState() => _TasklistState();
}

class _TasklistState extends State<Tasklist> {
  void initState() {
    super.initState();
  }

  // bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Item>>(
        future: DatabaseHelper.DatabaseHelperinstance.getGroceries(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: SpinKitWave(
              color: Colors.blue,
              size: 100.0,
            ));
          }
          return snapshot.data!.isEmpty
              ? Center(
                child: SizedBox(
                  width:double.infinity, child:Center(
                    child: Text(
                        'No Task',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 40.0,
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                  ),
                ),
              )
              : ListView(
                  children: snapshot.data!.map((grocery) {
                    return Center(
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            )),
                        // color: selectedId==grocery.id?Colors.grey:Colors.white,
                        child: task(
                            grocery.name, grocery.isDone == 1 ? true : false,
                            (newvalue) async {
                          // setState(() async{
                          await DatabaseHelper.DatabaseHelperinstance.toggle(
                              grocery);
                          // });
                          print('hello1');
                        }, () async {
                          await DatabaseHelper.DatabaseHelperinstance.remove(
                              grocery.id);
                          setState(() {});
                          print('hello2');
                        }, grocery),
                      ),
                    );
                  }).toList(),
                );
        });
  }
}
// return ListView.builder(itemBuilder:(context,index){
//     return task(Provider.of<Data>(context).ListOfTask[index].name,Provider.of<Data>(context).ListOfTask[index].isDone,(value){
//      setState((){
//        Provider.of<Data>(context,listen: false).ListOfTask[index].ToggleDone();
//      });
//
//
//     },(){
//       print('hello');
//       setState(() {
//         Provider.of<Data>(context,listen: false).remove(Provider.of<Data>(context,listen: false).ListOfTask[index]);
//
//       });
//      });
// },itemCount: Provider.of<Data>(context).ListOfTask.length,);
// Padding(
// padding: EdgeInsets.only(left: 30.0, top:5.0,right: 10,bottom:3.0),
// child: ListTile(
// onLongPress:longcallback,
// title: Text(TaskTitle.toString()==null?'':TaskTitle.toString(),

// trailing: Checkbox(
// value: ischecked,
// onChanged: callback,
// ),
// ),
// );
// () async {

// setState(() {
// // textController.clear();
// }
// Padding(
// padding: EdgeInsets.only(
// left: 30.0, top: 5.0, right: 10, bottom: 3.0),
// child: ListTile(
// trailing: Checkbox(
// value: ischecked,
// onChanged: (newvalue) async {
// setState(() {
// var temp = newvalue;
// ischecked = (temp == null) ? false : temp;
// });
//
// await DatabaseHelper.DatabaseHelperinstance
//     .toggle(grocery);
// },
// ),
// title: Text(
// grocery.name,
// style: TextStyle(
// decorationThickness:
// (grocery.isDone == 1) ? 4.0 : 0.0,
// decoration: (grocery.isDone == 1)
// ? TextDecoration.lineThrough
//     : null,
// decorationColor: (grocery.isDone == 1)
// ? Colors.lightBlueAccent
//     : null,
//
// ),
// ),
// onTap: () {},
// onLongPress: () async {
// await DatabaseHelper.DatabaseHelperinstance
//     .remove(grocery.id);
// setState(() {});
//
// // widget.longcallback;
// },
// ),
// ),
