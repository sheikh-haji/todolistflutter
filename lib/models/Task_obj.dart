class TaskObject{
   String? name;
   bool isDone;
  TaskObject({this.name='',this.isDone=false});
  void ToggleDone(){
    isDone=(!isDone);
  }
}