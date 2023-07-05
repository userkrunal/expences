import 'package:expences/utils/db_helper/dbhelper.dart';
import 'package:get/get.dart';

class ExpenceController extends GetxController
{
  RxList dataList=[].obs;

  DB_Helper db_helper=DB_Helper();
  Future<void> loaDB()
  async {
    dataList.value= await db_helper.read_Db();
  }
}