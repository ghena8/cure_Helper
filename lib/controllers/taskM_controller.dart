import 'package:CureHelper/db/db_helper.dart';
import 'package:get/get.dart';

import '../models/medicineTask.dart';

class TaskMController extends GetxController{

  @override
  void onReady(){
    super.onReady();
  }

  Future<int> addTaskM({medicineTask? task})async{
    return await DBHelper.insert(task);
  }
}