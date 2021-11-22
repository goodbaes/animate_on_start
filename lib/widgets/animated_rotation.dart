import 'package:animate_on_start/widgets/abstract_state.dart';
import 'package:flutter/material.dart';

class CustomAnimateRotation extends StatefulWidget {
  const CustomAnimateRotation({
    Key? key,
    required this.child,
    this.rotateAnimateDuration = const Duration(seconds: 1),
    this.rotateFirstValue = 0,
    this.rotateSecondValue = 1,
    this.curve = Curves.easeInOut,
  }) : super(key: key);
  final Duration rotateAnimateDuration;
  final Widget child;
  final Curve curve;
  final double rotateFirstValue;
  final double rotateSecondValue;
  @override
  StateCustomInit<CustomAnimateRotation> createState() =>
      _CustomAnimateRotationState();
}

class _CustomAnimateRotationState extends StateCustomInit<CustomAnimateRotation>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
        duration: widget.rotateAnimateDuration,
        curve: widget.curve,
        turns: init ? widget.rotateFirstValue : widget.rotateSecondValue,
        child: widget.child);
  }
}
