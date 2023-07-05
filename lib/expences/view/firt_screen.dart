import 'package:expences/expences/controller/ex_contorller.dart';
import 'package:expences/expences/model/ex_model.dart';
import 'package:expences/utils/db_helper/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsertScreen extends StatefulWidget {
  const InsertScreen({Key? key}) : super(key: key);

  @override
  State<InsertScreen> createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  TextEditingController eAmount = TextEditingController();
  TextEditingController eDate = TextEditingController();
  TextEditingController eStatus = TextEditingController();
  TextEditingController eTime = TextEditingController();
  TextEditingController eCategory = TextEditingController();

  ExpenceController expenceController=Get.put(ExpenceController());
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextF(title: "Amount",controller: eAmount,input: TextInputType.number),
           // TextF(title: "Notes",controller: eNotes,input: TextInputType.text),
            TextF(title: "Date",controller: eDate,input: TextInputType.text),
            TextF(title: "Status",controller: eStatus,input: TextInputType.text),
            TextF(title: "Time",controller: eTime,input: TextInputType.text),
            TextF(title: "Category",controller: eCategory,input: TextInputType.text),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () async {
              DB_Helper db_helper=DB_Helper();
              ExpenceModel model=ExpenceModel(
                amount: int.parse(eAmount.text),
                status: eStatus.text,
                category: eCategory.text,
                time: eTime.text,
                date: eDate.text,
              );
              await db_helper.insertinDb(model);

              await expenceController.loaDB();
              Get.back();
            }, child: Text("Submit"))
          ],
        ),
      ),
    ));
  }
  Widget TextF({title,controller,input})
  {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: controller,
          keyboardType: input,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            label: Text("$title"),
            hintText: "$title"
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}


