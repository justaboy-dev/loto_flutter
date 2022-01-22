// ignore_for_file: invalid_use_of_protected_member

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loto_project/controller/listnumcontroller.dart';

class ListNumScreen extends StatelessWidget {
  const ListNumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ListNumControllers controllers = Get.put(ListNumControllers());
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(size.width * 0.05),
        padding: EdgeInsets.all(size.width * 0.05),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: FadeInRight(
                duration: const Duration(milliseconds: 1300),
                child: Text(
                  "danh sách số".toUpperCase(),
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: size.width * 0.08,
                      fontWeight: FontWeight.bold),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              sliver: Obx(
                () => SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return ZoomIn(
                      duration: const Duration(milliseconds: 1000),
                      delay: Duration(milliseconds: 200 * index),
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            color: controllers.listnum.value[index].isEven
                                ? Colors.green
                                : Colors.red),
                        child: Center(
                          child: Text(
                              controllers.listnum.value[index].toString(),
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                    );
                  }, childCount: controllers.listnum.value.length),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
