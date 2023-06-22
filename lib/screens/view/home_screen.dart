
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/screens/controller/Task_Controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TaskController controller = Get.put(TaskController());

  @override
  void initState() {
    super.initState();
    controller.readData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Home Screen"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed("/add")!.then((value) => controller.readData());
          },
          child: Icon(Icons.add),
        ),
        body: Obx(
              () => ListView.builder(
              itemBuilder: (context, index) => GestureDetector(
                onLongPress: () {
                  Get.toNamed("/update", arguments: index);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (controller.readToList[index]['priority'] ==
                          "High")
                          ? Colors.red
                          : (controller.readToList[index]['priority'] ==
                          "Low")
                          ? Colors.green
                          : Colors.blue),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${controller.readToList[index]['title']}',
                            style: TextStyle(fontSize: 20),
                          ),
                          IconButton(
                              onPressed: () {
                                int id =
                                controller.readToList[index]['id'];
                                controller.DeleteData(id);
                              },
                              icon: Icon(Icons.delete)),
                        ],
                      ),
                      Text('${controller.readToList[index]['notes']}'),
                      Text('${controller.readToList[index]['priority']}'),
                      Text('${controller.readToList[index]['date']}'),
                    ],
                  ),
                ),
              ),
              itemCount: controller.readToList.length),
        ),
      ),
    );
  }
}