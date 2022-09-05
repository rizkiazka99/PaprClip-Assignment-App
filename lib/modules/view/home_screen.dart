import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paprclipassignmentapp/core/values/fonts.dart';
import 'package:paprclipassignmentapp/modules/controller/home_controller.dart';
import 'package:paprclipassignmentapp/modules/widget/skeleton_loader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Obx(() => controller.securityDataLoading == true ? Builder(
                  builder: (context) {
                    return Column(
                      children: List.generate(3, (index) => const SkeletonLoader()),
                    );
                  }
                ) : Text(
                  controller.securityData!.security,
                  style: bodyMd(),
                )),
                Obx(() => controller.securityPerformanceDataLoading == true ? Builder(
                  builder: (context) {
                    return Column(
                      children: List.generate(3, (index) => const SkeletonLoader()),
                    );
                  }
                ) : Builder(
                  builder: (context) {
                    return Column(
                      children: List.generate(controller.securityPerformanceData.length, (index) => Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '${controller.securityPerformanceData[index].label} :',
                                style: bodyMd(),
                              ),
                              Text(
                                '${controller.securityPerformanceData[index].changePercent}',
                                style: bodyMd(),
                              ),
                            ],
                          )
                        ],
                      )
                      
                      ),
                    );
                  }
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}