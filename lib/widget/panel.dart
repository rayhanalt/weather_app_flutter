import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slice_flutter/assets/colors.dart';
import 'package:slice_flutter/assets/icon.dart';
import 'package:slice_flutter/custom/indicator.dart';
import 'package:slice_flutter/custom/text.dart';
import 'package:slice_flutter/widget/panel/forecast.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelWidget extends StatefulWidget {
  final ScrollController scrollController;
  final PanelController panelController;
  final TabController tabController;
  const PanelWidget({
    super.key,
    required this.scrollController,
    required this.panelController,
    required this.tabController,
  });

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  final List<String> sampleTexts = [
    IconAssets.moonCloudFastWind,
    IconAssets.moonCloudMidRain,
    IconAssets.sunCloudAngledRain,
    IconAssets.sunCloudMidRain,
    IconAssets.tornado,
  ];

  late List<int> randomIndexes; // Deklarasi late untuk menunda inisialisasi

  @override
  void initState() {
    super.initState();
    randomIndexes = List.generate(10, (index) => Random().nextInt(sampleTexts.length));
  }

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.sizeOf(context).height / 1.41;
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24.0)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.5, sigmaY: 5.5),
        child: Container(
          color: ColorAssets.solid1.withOpacity(0.6), // Adjust color and opacity as needed
          child: Column(
            children: [
              const SizedBox(height: 12.0),
              GestureDetector(
                onTap: () {
                  widget.panelController.isPanelOpen
                      ? widget.panelController.close()
                      : widget.panelController.open();
                },
                child: Container(
                  width: 48.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: ColorAssets.dark.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 18.0),
              TabBar(
                isScrollable: false,
                controller: widget.tabController,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: TextCustom(
                      text: "Hourly Forecast",
                      fontWeight: FontWeight.w800,
                      fontSize: 15.0,
                      color: ColorAssets.secondary.withOpacity(0.5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: TextCustom(
                      text: "Weekly Forecast",
                      fontWeight: FontWeight.w800,
                      fontSize: 15.0,
                      color: ColorAssets.secondary.withOpacity(0.5),
                    ),
                  ),
                ],
                indicator: CustomTabIndicator(),
                indicatorWeight: 2,
                indicatorColor: ColorAssets.dark.withOpacity(0.1),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                height: 20,
                constraints: BoxConstraints(minHeight: heightScreen),
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: widget.tabController,
                  children: [
                    SizedBox(
                      height: 2,
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                addAutomaticKeepAlives: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, i) {
                                  // Menggunakan const di sini untuk mengoptimalkan performa
                                  // jika widget tidak membutuhkan rebuild setiap saat
                                  int randomIndex = randomIndexes[i];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.5,
                                    ),
                                    child: ForeCastWidget(
                                      text1: i != 3 ? '1$i AM' : 'Now',
                                      text2: '3$i%',
                                      text3: '2$i°',
                                      assetIcon: sampleTexts[randomIndex],
                                      color1:
                                          i == 3 ? ColorAssets.linearTwo1 : ColorAssets.linearOne1,
                                      color2:
                                          i == 3 ? ColorAssets.linearTwo2 : ColorAssets.linearOne2,
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                addAutomaticKeepAlives: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, i) {
                                  // Menggunakan const di sini untuk mengoptimalkan performa
                                  // jika widget tidak membutuhkan rebuild setiap saat
                                  int randomIndex = randomIndexes[i];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.5,
                                    ),
                                    child: ForeCastWidget(
                                      text1: i != 3 ? '1$i AM' : 'Now',
                                      text2: '3$i%',
                                      text3: '2$i°',
                                      assetIcon: sampleTexts[randomIndex],
                                      color1:
                                          i == 3 ? ColorAssets.linearTwo1 : ColorAssets.linearOne1,
                                      color2:
                                          i == 3 ? ColorAssets.linearTwo2 : ColorAssets.linearOne2,
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
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
