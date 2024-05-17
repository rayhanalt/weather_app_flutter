import 'package:flutter/material.dart';
import 'package:slice_flutter/assets/colors.dart';
import 'package:slice_flutter/assets/icon.dart';
import 'package:slice_flutter/custom/text.dart';

class ForeCastWidget extends StatelessWidget {
  final Color color1;
  final Color color2;

  final String text1;
  final String text2;
  final String text3;

  final String assetIcon;
  const ForeCastWidget({
    super.key,
    this.color1 = ColorAssets.linearOne1,
    this.color2 = ColorAssets.linearOne2,
    this.text1 = '12 AM',
    this.text2 = '30%',
    this.text3 = '19°',
    this.assetIcon = IconAssets.moonCloudMidRain,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.5, vertical: 16),
      decoration: BoxDecoration(
          color: ColorAssets.light,
          gradient: LinearGradient(
            colors: [
              color1,
              color2,
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          border: Border.all(color: ColorAssets.light.withOpacity(0.1))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextCustom(
            text: text1,
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                height: 38,
                image: AssetImage(assetIcon),
                fit: BoxFit.cover,
              ),
              TextCustom(
                text: text2,
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: ColorAssets.linearFour1,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          TextCustom(
            text: text3,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
