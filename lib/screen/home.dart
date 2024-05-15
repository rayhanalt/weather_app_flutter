import 'package:flutter/material.dart';
import 'package:slice_flutter/assets/images.dart';
import 'package:slice_flutter/custom/text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage(ImagesAssets.basePic),
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  TextCustom(),
                ],
              ),
              Image(
                image: AssetImage(ImagesAssets.house),
                fit: BoxFit.contain,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
