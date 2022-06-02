import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task_management/colors/app_colors.dart';
import 'package:task_management/utils/button_widget.dart';
import 'package:task_management/utils/text_widget.dart';
import 'package:get/get.dart';

class AllTask extends StatelessWidget {
  const AllTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List myData = ["Try Harder", "Try Smarter"];
    final leftEditDirection = Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF2e3253).withOpacity(0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
    );

    final rightDeleteDirection = Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
      alignment: Alignment.centerRight,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Container(
          padding: const EdgeInsets.only(left: 20, top: 60),
          alignment: Alignment.topLeft,
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: AppColors.secondaryColor,
            ),
          ),
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height / 3.2,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/header1.jpg"))),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(children: [
            Icon(Icons.home, color: AppColors.secondaryColor),
            const SizedBox(
              width: 20,
            ),
            Container(
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.5),
                color: Colors.black54,
              ),
            ),
            Expanded(child: Container()),
            Icon(Icons.calendar_month_sharp, color: AppColors.secondaryColor),
            const SizedBox(
              width: 20,
            ),
            Text("2",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.secondaryColor,
                )),
          ]),
        ),
        Flexible(
          child: ListView.builder(
              itemCount: myData.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: leftEditDirection,
                  secondaryBackground: rightDeleteDirection,
                  onDismissed: (DismissDirection direction) {
                    print("left");
                  },
                  confirmDismiss: (DismissDirection direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          barrierColor: Colors.transparent,
                          builder: (_) {
                            return Container(
                              height: 250,
                              decoration: BoxDecoration(
                                color: const Color(0xFF2e3253).withOpacity(0.4),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ButtonWidget(
                                          backgroundColor: AppColors.mainColor,
                                          color: Colors.white,
                                          text: "View"),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      ButtonWidget(
                                          backgroundColor: AppColors.mainColor,
                                          color: Colors.white,
                                          text: "Edit"),
                                    ]),
                              ),
                            );
                          });
                      return false;
                    } else {
                      return Future.delayed(Duration(seconds: 1),
                          () => direction == DismissDirection.endToStart);
                    }
                  },
                  key: ObjectKey(index),
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: TaskWidget(
                      text: myData[index],
                      color: Colors.blueGrey,
                    ),
                  ),
                );
              }),
        ),
      ]),
    );
  }
}
