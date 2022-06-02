import 'package:flutter/material.dart';
import 'package:task_management/colors/app_colors.dart';
import 'package:task_management/screens/all_task.dart';
import 'package:task_management/utils/button_widget.dart';
import 'package:get/get.dart';

import 'add_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                  text: TextSpan(
                      text: "Home",
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainColor),
                      children: [
                    TextSpan(
                        text: "\nStart your beautiful day",
                        style: TextStyle(
                          color: AppColors.smallTextColor,
                          fontSize: 14,
                        ))
                  ])),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const AddTask(),
                      transition: Transition.zoom,
                      duration: const Duration(milliseconds: 500));
                },
                child: ButtonWidget(
                    backgroundColor: AppColors.mainColor,
                    color: Colors.white,
                    text: "Add Task"),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const AllTask(),
                      transition: Transition.fade,
                      duration: const Duration(milliseconds: 500));
                },
                child: ButtonWidget(
                    backgroundColor: Colors.white,
                    color: AppColors.smallTextColor,
                    text: "View All"),
              ),
            ],
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/welcome.jpg")),
          )),
    );
  }
}
