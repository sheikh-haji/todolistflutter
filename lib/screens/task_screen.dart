import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist/widgets/list.dart';
import 'package:todolist/screens/Addtask_screen.dart';
import 'package:todolist/models/Task_obj.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/items.dart';
// import 'dart:js' as js;

import 'package:todolist/models/database.dart';
import 'package:url_launcher/url_launcher.dart';

class TaskScreen extends StatefulWidget {
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  String temp = 'ToDoList';
  int l = 0;
  String task = '';

  void func() async {
    var l1 = await Provider.of<DatabaseHelper>(context).length();
    setState(() {
      l = l1;
    });
  }

  void initState() {
    super.initState();
    func();
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // GestureDetector

  @override
  Widget build(BuildContext context) {
    func();
    return Scaffold(
      key: _scaffoldKey,
      // drawer: Drawer(),
        drawerEnableOpenDragGesture: false,
      drawer:  Drawer(
        child: NavDrawer(),
      ),
      // appBar: AppBar(
      //   title: Text('Side menu'),
      // ),
      // drawer: NavDrawer(),
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return Addtask((String? newvalue) {
                  String? task1 = newvalue;
                  print(task1);
                  task = (task1 == null) ? '' : task1;
                });
              });
          setState(() {
            if (task != '') {
              Provider.of<DatabaseHelper>(context, listen: false)
                  .add(Item(name: task));
              func();
            }
          });

          // Tasklist(widget.ListOfTask);
          // l=Provider.of<Data>(context).ListOfTask.length;
          // setState(() {
          //   // temp='TodoList';
          //   try{
          //     Provider.of<Data>(context).ListOfTask[l-1].ToggleDone();
          //     Provider.of<Data>(context).ListOfTask[l-1].ToggleDone();}
          //   catch(e){
          //     print("list empty");
          //   }
          // });
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                EdgeInsets.only(top: 60, left: 30.0, bottom: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextButton(
                  onPressed:  () {
                    // _key.currentState?.openDrawer();
                    // Scaffold.of(context).openDrawer();
                    _scaffoldKey.currentState?.openDrawer();
                  print('ghgghhghg');},
                  child: CircleAvatar(
                      child: Icon(
                        Icons.list,
                        size: 30.0,
                        color: Colors.lightBlueAccent,
                      ),
                      backgroundColor: Colors.white,
                      radius: 30.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  temp,
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 60.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(l.toString() + ' Tasks',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            // color: Colors.white,
            // height: 600.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0)),
            ),
            child: Tasklist(longcallback: () async {
              func();
            }),
          ))
        ],
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            title: CircleAvatar(
              radius: 160,
              backgroundColor: Colors.blue,
              child: CircleAvatar(
                radius: 150,
                backgroundColor: Colors.blue,
                backgroundImage: AssetImage('images/temp.png'),
              ),
            ),
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              topLeft: Radius.circular(20),
            )),
            child: TextButton(
              onPressed: ()async{
                _launchURL();
              },
              child: ListTile(

                leading: Icon(
                  Icons.info_outline,
                  size: 20.0,
                  color: Colors.blue,
                ),
                title: Text(
                  'About Me',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 20.0,
                    color: Colors.grey,
                    // fontWeight: FontWeight.bold,
                  ),
                ),

              ),
            ),
          ),
        ],
      ),
    );
  }

  _launchURL() async {
    const _url = 'http://sheikhhaji.onrender.com';
    var url1 = Uri.parse(_url);

    if (await canLaunchUrl(url1)) {
      await launchUrl(url1);
    } else {
      throw 'Could not launch $url1';
    }
  }
}
