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
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Image(
            image: AssetImage(ImagesAssets.basePic),
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    );
  }
}
