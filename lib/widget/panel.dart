import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:slice_flutter/assets/colors.dart';
import 'package:slice_flutter/custom/indicator.dart';
import 'package:slice_flutter/custom/text.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelWidget extends StatefulWidget {
  final ScrollController controller;
  final PanelController panelController;
  final TabController tabController;
  const PanelWidget({
    super.key,
    required this.controller,
    required this.panelController,
    required this.tabController,
  });

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  final ScrollController hourlyScrollController = ScrollController();
  final ScrollController weeklyScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
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
                  widget.panelController.panelPosition.round() == 1
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
                tabAlignment: TabAlignment.fill,
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
                // indicatorColor: Colors.white,
                // tabAlignment: TabAlignment.fill,
                // labelColor: Colors.white,
                // indicatorWeight: 10,
                indicator: CustomTabIndicator(),
                // unselectedLabelColor: Colors.grey,
                dividerColor: ColorAssets.dark.withOpacity(0.1),
                dividerHeight: 2,
                // labelStyle: const TextStyle(
                //     fontSize: 16.0, fontWeight: FontWeight.w800, fontFamily: 'SFProDisplay'),
                // unselectedLabelStyle: const TextStyle(fontSize: 16.0),
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: widget.tabController,
                  children: [
                    PrimaryScrollController(
                      controller: widget.controller,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView(
                          controller: hourlyScrollController,
                          children: const [
                            TextCustom(text: "Hour "),
                            TextCustom(text: "Details"),
                          ],
                        ),
                      ),
                    ),
                    PrimaryScrollController(
                      controller: widget.controller,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView(
                          controller: weeklyScrollController,
                          children: const [
                            TextCustom(text: "Week "),
                            TextCustom(text: "Details"),
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

  @override
  void dispose() {
    // Dispose controllers when not needed anymore
    hourlyScrollController.dispose();
    weeklyScrollController.dispose();
    super.dispose();
  }
}
