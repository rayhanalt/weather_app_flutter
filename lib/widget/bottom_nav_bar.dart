import 'package:flutter/material.dart';
import 'package:slice_flutter/assets/colors.dart';
import 'package:slice_flutter/assets/icon.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final heightButton = MediaQuery.of(context).size.height * 0.07;
    final widthButton = MediaQuery.of(context).size.width * 0.35;
    return Container(
      color: Colors.transparent,
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(-20),
                      // color: Colors.amber,
                    ),
                    width: widthButton,
                    height: heightButton,
                    child: ClipPath(
                      clipper: SinglePeakMountainClipper(),
                      child: Container(
                        // height: , // Sesuaikan dengan kebutuhan
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
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
    Path path = Path();
    path.moveTo(0, size.height); // Mulai dari kiri bawah
    path.quadraticBezierTo(
      size.width * 0.5, size.height * 2, // Titik kontrol di tengah atas
      size.width, size.height, // Titik akhir di kanan bawah
    );
    path.lineTo(size.width, 0); // Garis ke kanan atas
    path.lineTo(0, 0); // Garis ke kiri atas
    path.close(); // Tutup path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
