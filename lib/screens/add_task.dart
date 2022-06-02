import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/colors/app_colors.dart';
import 'package:task_management/utils/button_widget.dart';
import 'package:task_management/utils/textfield.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/addtask1.jpg")),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 16),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: AppColors.secondaryColor,
                  ),
                ],
              ),
              Column(
                children: [
                  TextFieldwidget(
                    textController: nameController,
                    hinttext: "Task Name",
                    borderRadius: 30,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldwidget(
                    textController: detailController,
                    hinttext: "Task Detail",
                    borderRadius: 15,
                    maxLines: 3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                      backgroundColor: AppColors.mainColor,
                      color: Colors.white,
                      text: "Add"),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 20),
            ]),
      ),
    );
  }
}
