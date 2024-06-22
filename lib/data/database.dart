
import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDOList = []; 

  final _myBox = Hive.box('The Box ');



  //for 1st time users
  void createInitData() {

    toDOList = [

      ["make a tutorial", false],
      ["cook dinner", false],

    ];
  }

  //load data from database
  void loadData(){
    toDOList = _myBox.get("ToDoList");

  }

  //update databse
  void updateDataBase(){_myBox.put("ToDoList", toDOList);
    
  }
  
}