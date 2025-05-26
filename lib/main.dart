import 'package:flutter/material.dart';
import 'package:todolist/screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/database.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DatabaseHelper>(
      create:(context){
        return DatabaseHelper();
      },
      child: MaterialApp(
          debugShowCheckedModeBanner:false,

        home: TaskScreen(),

      ),
    );
  }
}
