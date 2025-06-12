import 'dart:math';
import 'dart:ui';

import 'package:first_app/ui/pages/home/components/dargable_widget.dart';
import 'package:flutter/material.dart';

class CardContainer extends StatefulWidget {
  final Function(BuildContext context, int index) itemBuilder;
  final int iteamCount;
  final int index;

  const CardContainer({
    super.key,
    required this.itemBuilder,
    required this.iteamCount,
    this.index = 0,
  });

  @override
  State<CardContainer> createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer>
    with SingleTickerProviderStateMixin {
  // final double defaultAngle18Dgree = pi * 0.1;
  final double defaultAngle18Dgree = 0;

  late AnimationController controller;
  late int index;

  SlideDirection slideDirection = SlideDirection.left;

  Offset getOffser(int stackIndex) {
    return {
          // 0: Offset(lerpDouble(0, -70, controller.value)!, 30),
          // 1: Offset(lerpDouble(-70, -70, controller.value)!, 30),
          // 2: Offset(70, 30) * (1 - controller.value),
          0: Offset(lerpDouble(0, -60, controller.value)!, 0),
          1: Offset(lerpDouble(-60, -60, controller.value)!, 0),
          2: Offset(60, 0) * (1 - controller.value),
        }[stackIndex] ??
        Offset(
            MediaQuery.of(context).size.width *
                controller.value *
                (slideDirection == SlideDirection.left ? -1 : 1),
            0);
  }

  double getAngle(int stackIndex) =>
      {
        0: lerpDouble(0, -defaultAngle18Dgree, controller.value),
        1: lerpDouble(
            -defaultAngle18Dgree, defaultAngle18Dgree, controller.value),
        2: lerpDouble(defaultAngle18Dgree, 0, controller.value),
      }[stackIndex] ??
      0.0;

  // We are almost made it, it feels so good to slide
  double getScal(int stackIndex) =>
      {
        // 0: lerpDouble(0.6, 0.9, controller.value),
        // 1: lerpDouble(0.9, 0.95, controller.value),
        // 2: lerpDouble(0.95, 1, controller.value),
        0: lerpDouble(0.4, 0.8, controller.value),
        1: lerpDouble(0.8, 1, controller.value),
        2: lerpDouble(0.8, 1, controller.value),
      }[stackIndex] ??
      1.0;

  void onSlideOut(SlideDirection direction) {
    slideDirection = direction;
    controller.forward();
  }

  void animationListener() {
    if (controller.isCompleted) {
      // Pretty soon you will get it
      // It helps us to make it infinite slide
      setState(() {
        if (widget.iteamCount == ++index) {
          index = 0;
        }
      });
      controller.reset();
    }
  }

  void initState() {
    index = widget.index;
    controller =
        AnimationController(vsync: this, duration: kThemeAnimationDuration)
          ..addListener(animationListener);
    super.initState();
  }

  @override
  void dispose() {
    controller
      ..removeListener(animationListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return Stack(
              children: List.generate(4, (stackIndex) {
            final modeIndex = (index + 3 - stackIndex) % widget.iteamCount;
            return Transform.translate(
              offset: getOffser(stackIndex),
              child: Transform.scale(
                scale: getScal(stackIndex),
                child: Transform.rotate(
                  angle: getAngle(stackIndex),
                  child: DargableWidget(
                    onSlideOut: onSlideOut,
                    isEnableDrag: stackIndex == 3,
                    child: widget.itemBuilder(context, modeIndex),
                  ),
                ),
              ),
            );
          }));
        });
  }
}
