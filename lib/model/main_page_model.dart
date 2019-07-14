import 'package:flutter/material.dart';
import 'package:todo_list/database/database.dart';
import 'package:todo_list/logic/all_logic.dart';
import 'package:todo_list/json/task_bean.dart';


class MainPageModel extends ChangeNotifier{

  MainPageLogic logic;
  BuildContext context;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<TaskBean> tasks = [];

  int currentCardIndex = 0;

  MainPageModel(){
    logic = MainPageLogic(this);
  }

  void setContext(BuildContext context){
    if(this.context == null){
        this.context = context;
        logic.getTasks();
    }
  }

  @override
  void dispose(){
    super.dispose();
    scaffoldKey?.currentState?.dispose();
    debugPrint("MainPageModel销毁了");
  }

  void refresh(){
    notifyListeners();
  }
}