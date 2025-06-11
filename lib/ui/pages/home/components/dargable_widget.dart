import 'package:flutter/material.dart';

enum SlideDirection { left, right }

class DargableWidget extends StatefulWidget {
  final Widget child;
  final ValueChanged<SlideDirection>? onSlideOut;
  final VoidCallback? onPressed;
  final bool isEnableDrag;

  const DargableWidget(
      {super.key,
      required this.child,
      this.onSlideOut,
      this.onPressed,
      required this.isEnableDrag});

  @override
  State<DargableWidget> createState() => _DargableWidgetState();
}

class _DargableWidgetState extends State<DargableWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
