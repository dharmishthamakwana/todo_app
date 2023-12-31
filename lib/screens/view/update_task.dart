import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/screens/controller/Task_Controller.dart';
import 'package:untitled2/utiles/dbhelper.dart';

class UpdateTask extends StatefulWidget {
  const UpdateTask({Key? key}) : super(key: key);

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  int index = Get.arguments;
  TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    TextEditingController txttitle =
        TextEditingController(text: "${controller.readToList[index]['title']}");
    TextEditingController txtnotes =
        TextEditingController(text: "${controller.readToList[index]['notes']}");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Update Data"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: () {
                        DbHelper dbhelper = DbHelper();
                        int id = controller.readToList[index]['id'];
                        String date =
                            "${controller.currentdate.value.year}/${controller.currentdate.value.month}/${controller.currentdate.value.day}";
                        controller.UpdateData(
                            priority: "High",
                            notes: txtnotes.text,
                            date: "$date",
                            time: "${controller.currenttime.value}",
                            title: txttitle.text,
                            id: id);
                        Get.back();
                      },
                      child: Container(
                        height: 35,
                        width: 70,
                        child: Center(
                          child: Text(
                            "High",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red.shade200,
                            borderRadius: BorderRadius.circular(30)),
                      )),
                  InkWell(
                      onTap: () {
                        DbHelper dbhelper = DbHelper();
                        int id = controller.readToList[index]['id'];
                        String date =
                            "${controller.currentdate.value.year}/${controller.currentdate.value.month}/${controller.currentdate.value.day}";
                        controller.UpdateData(
                            priority: "Low",
                            notes: txtnotes.text,
                            date: "$date",
                            time: "${controller.currenttime.value}",
                            title: txttitle.text,
                            id: id);
                        Get.back();
                      },
                      child: Container(
                        height: 35,
                        width: 70,
                        child: Center(
                          child: Text(
                            "Low",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.green.shade200,
                            borderRadius: BorderRadius.circular(30)),
                      )),
                  InkWell(
                    onTap: () {
                      DbHelper dbhelper = DbHelper();
                      int id = controller.readToList[index]['id'];
                      String date =
                          "${controller.currentdate.value.year}/${controller.currentdate.value.month}/${controller.currentdate.value.day}";
                      controller.UpdateData(
                          priority: "Urgent",
                          notes: txtnotes.text,
                          date: "$date",
                          time: "${controller.currenttime.value}",
                          title: txttitle.text,
                          id: id);
                      Get.back();
                    },
                    child: Container(
                      height: 35,
                      width: 70,
                      child: Center(
                        child: Text(
                          "urgent",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.blue.shade300,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: txttitle,
                cursorColor: Colors.teal,
                decoration: InputDecoration(
                  label: Text("title", style: TextStyle(color: Colors.teal)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1.5, color: Colors.teal),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                child: TextFormField(
                  controller: txtnotes,
                  cursorColor: Colors.teal,

                  decoration: InputDecoration(
                    label: Text("notes",style: TextStyle(color: Colors.teal)),
                    focusedBorder: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1.5,color: Colors.teal),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),

                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Choose Date",
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 45,
                width: 207,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.teal, width: 1),

                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                ),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(right: 5, top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                    () => Text(
                      "${controller.currentdate.value.year}/${controller.currentdate.value.month}/${controller.currentdate.value.day}",
                      style:
                          TextStyle(color: Colors.teal.shade700, fontSize: 18),
                    ),
                  ),
                    IconButton(onPressed: () async {
                      DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: controller.currentdate.value,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030),
                        builder: (context, child) => Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                  primary: Color(0XFF1E2140),
                                  onPrimary: Colors.white,
                                  onSurface: Colors.teal),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  primary: Color(0XFF1E2140),
                                ),
                              ),
                            ),
                            child: child!),
                      );
                      controller.setdate(date!);
                    }, icon:Icon(Icons.date_range_outlined,) )
               ] ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Choose Time",
                style: TextStyle(fontSize: 19),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.teal, width: 1),

                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                ),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(right: 5, top: 5, bottom: 5),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                          () => Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${controller.currenttime.value.hour}:${controller.currenttime.value.minute}",
                          style: TextStyle(
                              color: Colors.grey.shade700, fontSize: 18),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        TimeOfDay? pickedtime = await showTimePicker(
                          context: context,
                          initialTime: controller.currenttime.value,
                          builder: (context, child) => MediaQuery(
                              data: MediaQuery.of(context)
                                  .copyWith(alwaysUse24HourFormat: false),
                              child: child!),
                        );
                        controller.currenttime.value = pickedtime!;
                      },
                      icon: Icon(
                        Icons.schedule_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
