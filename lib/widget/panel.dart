import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:slice_flutter/custom/text.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelWidget extends StatefulWidget {
  final ScrollController controller;
  final PanelController panelController;
  const PanelWidget({
    super.key,
    required this.controller,
    required this.panelController,
  });

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      controller: widget.controller,
      children: [
        GestureDetector(
          onTap: () {
            widget.panelController.panelPosition.round() == 1
                ? widget.panelController.close()
                : widget.panelController.open();
          },
          child: Center(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            width: 48,
            height: 6,
          )),
        ),
        const TextCustom(),
        const TextCustom(),
      ],
    );
  }
}
