import 'package:animate_on_start/widgets/behvior/auto_start_behavior.dart';
import 'package:flutter/material.dart';

class CustomAnimateRotation extends StatefulWidget {
  const CustomAnimateRotation({
    Key? key,
    required this.child,
    this.rotateAnimateDuration = const Duration(seconds: 1),
    this.rotateFirstValue = 0,
    this.rotateSecondValue = 1,
    this.curve = Curves.easeInOut,
    this.onAnimationEnd,
    this.onAnimationStart,
    this.isRepeat = false,
  }) : super(key: key);

  final Duration rotateAnimateDuration;
  final Widget child;
  final Curve curve;
  final Function()? onAnimationEnd;
  final Function()? onAnimationStart;
  final double rotateFirstValue;
  final double rotateSecondValue;
  final bool isRepeat;

  @override
  AutoStartBehavior<CustomAnimateRotation> createState() =>
      // ignore: no_logic_in_create_state
      _CustomAnimateRotationState(
        isRepeat: isRepeat,
        duration: rotateAnimateDuration,
        onEnd: onAnimationEnd,
        onStart: onAnimationStart,
      );
}

class _CustomAnimateRotationState
    extends AutoStartBehavior<CustomAnimateRotation> {
  _CustomAnimateRotationState({
    required bool isRepeat,
    required Duration duration,
    Function()? onEnd,
    Function()? onStart,
  }) : super(
          isRepeat: isRepeat,
          duration: duration,
          onEnd: onEnd,
          onStart: onStart,
        );

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns:
          Tween(begin: widget.rotateFirstValue, end: widget.rotateSecondValue)
              .animate(animateController),
      child: widget.child,
    );
  }
}
