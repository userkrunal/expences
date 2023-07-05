import 'package:expences/expences/controller/ex_contorller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ExpenceController expenceController=Get.put(ExpenceController());

  @override
  void initState() {
    super.initState();
    expenceController.loaDB();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Obx(
              () =>  ListView.builder(
            itemCount: expenceController.dataList.length,
            itemBuilder: (context, index) {
              return  ListTile(
                leading: Text("${expenceController.dataList[index]['id']}"),
                title: Text("${expenceController.dataList[index]['category']}"),
                subtitle: Text("${expenceController.dataList[index]['amount']}"),
                trailing: Text("${expenceController.dataList[index]['status']}"),
              );
            },
          ),
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/first');
        },child: Icon(Icons.add),
      ),
    ));
  }
}
