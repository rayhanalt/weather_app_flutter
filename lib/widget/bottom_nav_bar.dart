import 'package:flutter/material.dart';
import 'package:slice_flutter/assets/colors.dart';
import 'package:slice_flutter/assets/icon.dart';
import 'package:slice_flutter/assets/images.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final heightButton = MediaQuery.of(context).size.height * 0.07;
    final widthButton = MediaQuery.of(context).size.width * 0.35;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Stack(
        children: [
          ClipPath(
            clipper: UShapeClipper(),
            child: Container(
              height: 88, // Sesuaikan dengan kebutuhan
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorAssets.linearOne1,
                    ColorAssets.linearOne2,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(
                    height: 44,
                    image: AssetImage(IconAssets.map),
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        // borderRadius: BorderRadius.circular(-20),
                        // color: Colors.amber,
                        ),
                    width: widthButton,
                    height: heightButton,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          colors: [
                            ColorAssets.linearOne1.withOpacity(0.5),
                            ColorAssets.linearOne2.withOpacity(0.5),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.srcATop,
                      child: const Image(
                        // height: 44,
                        image: AssetImage(ImagesAssets.subtract),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Image(
                    height: 44,
                    image: AssetImage(IconAssets.list),
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, size.height * 0.2)
      ..quadraticBezierTo(size.width / 2, size.height, size.width, size.height * 0.2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class SinglePeakMountainClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.6);
    var controlPoint = Offset(size.width / 2, size.height);
    var endPoint = Offset(size.width, size.height * 0.6);

    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
