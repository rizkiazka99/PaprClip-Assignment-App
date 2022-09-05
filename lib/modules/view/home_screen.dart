import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paprclipassignmentapp/core/values/colors.dart';
import 'package:paprclipassignmentapp/core/values/fonts.dart';
import 'package:paprclipassignmentapp/modules/controller/home_controller.dart';
import 'package:paprclipassignmentapp/modules/widget/skeleton_loader.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [Colors.black, contextRed, Colors.white]
        )
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Obx(() => controller.securityDataLoading == false ? Text(
            controller.securityData!.security) : const SizedBox.shrink()),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3)
                )
              ]
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overview',
                    style: h4(color: contextRed),
                  ),
                  const Divider(
                    thickness: 2,
                    color: contextRed,
                  ),
                  Obx(() => controller.securityDataLoading == true ? Builder(
                    builder: (context) {
                      return Column(
                        children: List.generate(3, (index) => const SkeletonLoader()),
                      );
                    }
                  ) : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sector',
                            style: bodyMd(color: Colors.black),
                          ),
                          Text(
                            controller.securityData!.sector,
                            style: bodyMd(color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Industry',
                            style: bodyMd(color: Colors.black),
                          ),
                          Text(
                            controller.securityData!.industry,
                            style: bodyMd(color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Market Cap.',
                            style: bodyMd(color: Colors.black),
                          ),
                          Text(
                            '${controller.securityData!.mcap.toStringAsFixed(2)} Cr.',
                            style: bodyMd(color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Enterprise Value (EV)',
                            style: bodyMd(color: Colors.black),
                          ),
                          Text(
                            controller.securityData!.ev == null ? '-' :
                                controller.securityData!.ev,
                            style: bodyMd(color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'PEG Ratio',
                            style: bodyMd(color: Colors.black),
                          ),
                          Text(
                            controller.securityData!.pegRatio.toStringAsFixed(2),
                            style: bodyMd(color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Book Value/Share',
                            style: bodyMd(color: Colors.black),
                          ),
                          Text(
                            controller.securityData!.bookNavPerShare.toStringAsFixed(2),
                            style: bodyMd(color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dividend Yield',
                            style: bodyMd(color: Colors.black),
                          ),
                          Text(
                            controller.securityData!.securityResponseYield.toStringAsFixed(2),
                            style: bodyMd(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  )),
                  const SizedBox(height: 16),
                  Text(
                    'Performance',
                    style: h4(color: contextRed),
                  ),
                  const Divider(
                    thickness: 2,
                    color: contextRed,
                  ),
                  Obx(() => controller.securityPerformanceDataLoading == true ? Builder(
                    builder: (context) {
                      return Column(
                        children: List.generate(3, (index) => const SkeletonLoader()),
                      );
                    }
                  ) : Builder(
                    builder: (context) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: GridView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          children: List.generate(controller.securityPerformanceData.length, (index) => SfRadialGauge(
                            title: GaugeTitle(
                              text: controller.securityPerformanceData[index].label,
                              textStyle: h6()
                            ),
                            axes: <RadialAxis>[
                              RadialAxis(
                                minimum: 0,
                                maximum: 100,
                                ranges: [
                                  GaugeRange(startValue: 0, endValue: 25, color: contextRed,),
                                  GaugeRange(startValue: 25, endValue: 50, color: contextYellow),
                                  GaugeRange(startValue: 50, endValue: 75, color: Colors.lightGreen),
                                  GaugeRange(startValue: 75, endValue: 100, color: contextGreen)
                                ],
                                pointers: <GaugePointer>[
                                  NeedlePointer(
                                    value: controller.securityPerformanceData[index].changePercent,
                                  )
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                    widget: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Colors.black
                                        )
                                      ),
                                      child: Text(
                                        '${controller.securityPerformanceData[index].changePercent.toStringAsFixed(1)} %',
                                        style: h7(fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    angle: 90,
                                    positionFactor: 0.5,
                                  )
                                ],
                              )
                            ],
                          )),
                        ),
                      );
                    }
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}