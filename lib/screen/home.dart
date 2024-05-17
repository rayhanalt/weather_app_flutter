import 'package:flutter/material.dart';
import 'package:slice_flutter/assets/colors.dart';
import 'package:slice_flutter/assets/icon.dart';
import 'package:slice_flutter/assets/images.dart';
import 'package:slice_flutter/custom/text.dart';
import 'package:slice_flutter/widget/bottom_nav_bar.dart';
import 'package:slice_flutter/widget/panel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final PanelController panelController = PanelController();

  bool ontapButton = false;

  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.8;
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.35;
    return Scaffold(
      body: Stack(
        children: [
          SlidingUpPanel(
            controller: panelController,
            maxHeight: panelHeightOpen,
            minHeight: panelHeightClosed,
            backdropColor: Colors.white,
            backdropOpacity: 0.7,
            parallaxEnabled: true,
            parallaxOffset: 0.1,
            color: ColorAssets.solid1.withOpacity(0),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            body: Stack(
              fit: StackFit.expand,
              children: [
                const Image(
                  image: AssetImage(ImagesAssets.basePic),
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 150),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const TextCustom(
                            text: "Montreal",
                            fontSize: 34,
                            fontWeight: FontWeight.w500,
                          ),
                          const TextCustom(
                            text: "19°",
                            fontSize: 96,
                            fontWeight: FontWeight.w200,
                          ),
                          TextCustom(
                            text: "Mostly Clear",
                            fontSize: 20,
                            color: Colors.grey.withOpacity(1),
                            fontWeight: FontWeight.w800,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextCustom(
                                text: "H:24°",
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                              TextCustom(
                                text: "L:18°",
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Image(
                      image: AssetImage(ImagesAssets.house),
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ],
            ),
            panelBuilder: (sc) => PanelWidget(
              controller: sc,
              panelController: panelController,
              tabController: tabController,
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavBar(),
          ),
          // const Positioned(
          //   top: 0,
          //   right: 0,
          //   left: 0,
          //   bottom: 0,
          //   child: Image(
          //     // height: ,
          //     image: AssetImage(IconAssets.button),
          //     // fit: BoxFit.fill,
          //   ),
          // )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () async {
          setState(() {
            ontapButton = true;
          });
          print('Tapped');
          await Future.delayed(const Duration(milliseconds: 100));
          setState(() {
            ontapButton = false;
          });
        },
        child: Image(
          height: panelHeightClosed / 5.1,
          image: AssetImage(ontapButton ? IconAssets.buttonPressed : IconAssets.button),
          // fit: BoxFit.fill,
        ),
      ),
    );
  }
}
