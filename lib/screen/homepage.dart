import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:loto_project/controller/homepagecontroller.dart';

class HomePageScreens extends StatefulWidget {
  const HomePageScreens({Key? key}) : super(key: key);

  @override
  State<HomePageScreens> createState() => _HomePageScreensState();
}

class _HomePageScreensState extends State<HomePageScreens>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    HomePageController controller = Get.put(HomePageController());
    AnimationController animated = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 800,
        ),
        reverseDuration: const Duration(milliseconds: 300));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Container(
              margin: EdgeInsets.all(size.width * 0.05),
              padding: EdgeInsets.all(size.width * 0.05),
              child: Column(
                children: [
                  const Spacer(),
                  FadeInRight(
                    duration: const Duration(milliseconds: 1300),
                    child: Text(
                      "Lô tô\nmại dzô mại dzô".toUpperCase(),
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: size.width * 0.08,
                          fontWeight: FontWeight.bold),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  ZoomIn(
                    duration: const Duration(milliseconds: 1300),
                    delay: const Duration(milliseconds: 400),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: Container(
                        height: size.width * 0.4,
                        width: size.width * 0.4,
                        color: Colors.red.withOpacity(0.7),
                        child: Center(
                          child: controller.obx(
                              (state) => ZoomIn(
                                    controller: (_) => animated,
                                    duration: const Duration(milliseconds: 800),
                                    child: Text(
                                      controller.number.value.toString(),
                                      style: TextStyle(
                                          fontSize: size.width * 0.1,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                              onLoading: const LoadingIndicator(
                                  indicatorType: Indicator.ballClipRotatePulse,
                                  colors: [
                                    Colors.red,
                                    Colors.green,
                                    Colors.blue
                                  ],
                                  strokeWidth: 2,
                                  backgroundColor: Colors.white,
                                  pathBackgroundColor: Colors.red),
                              onEmpty: const Image(
                                image: AssetImage("assets/empty.png"),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1300),
                    delay: const Duration(milliseconds: 800),
                    child: GestureDetector(
                      onTap: () => controller.getNumber(animated),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.35,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.green),
                        child: Center(
                            child: Text(
                          "Số tiếp",
                          style: TextStyle(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      FadeInUp(
                        duration: const Duration(milliseconds: 1300),
                        delay: const Duration(milliseconds: 1200),
                        child: GestureDetector(
                          onTap: () => controller.onViewList(),
                          child: Container(
                            height: size.height * 0.08,
                            width: size.width * 0.35,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: Colors.green),
                            child: Center(
                                child: Text(
                              "Danh sách số",
                              style: TextStyle(
                                  fontSize: size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1300),
                        delay: const Duration(milliseconds: 1200),
                        child: GestureDetector(
                          onTap: () => controller.onNewGame(),
                          child: Container(
                            height: size.height * 0.08,
                            width: size.width * 0.35,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: Colors.green),
                            child: Center(
                                child: Text(
                              "Ván mới",
                              style: TextStyle(
                                  fontSize: size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
