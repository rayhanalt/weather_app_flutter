import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(this, onChanged);
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;

  _CustomPainter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint();
    paint.color = Colors.black; // Warna indikator
    paint.style = PaintingStyle.fill;

    final double indicatorWidth =
        configuration.size!.width / 0.5; // Lebar indikator sesuai jumlah tab
    const double indicatorHeight = 2.0; // Tinggi indikator

    const double startOpacity = 0.1; // Opacity awal di bagian kiri
    const double endOpacity = 0.1; // Opacity akhir di bagian kanan

    const double opacityDiff = (1.0 - startOpacity - endOpacity) / 2; // Selisih opacity di tengah

    final Rect indicatorRect = Rect.fromLTWH(
      offset.dx + (configuration.size!.width - indicatorWidth) / 2,
      offset.dy + configuration.size!.height - indicatorHeight,
      indicatorWidth,
      indicatorHeight,
    );

    final Gradient gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Colors.transparent, // Transparent di kiri
        Colors.grey.withOpacity(startOpacity), // Opacity di kiri
        Colors.grey.withOpacity(startOpacity + opacityDiff), // Opacity di tengah kiri
        Colors.grey.withOpacity(1.0 - endOpacity - opacityDiff), // Opacity di tengah kanan
        Colors.grey.withOpacity(1.0 - endOpacity), // Opacity di kanan
        Colors.transparent, // Transparent di kanan
      ],
      stops: const [
        0.0,
        0.1,
        0.3,
        0.3,
        0.5,
        1.0,
      ],
    );

    paint.shader = gradient.createShader(indicatorRect);

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        indicatorRect,
        topLeft: const Radius.circular(10.0), // Bentuk ujung lancip di kiri
        topRight: const Radius.circular(10.0), // Bentuk ujung lancip di kanan
      ),
      paint,
    );
  }
}
