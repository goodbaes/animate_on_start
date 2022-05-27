import 'package:animate_on_start/widgets/behvior/auto_start_behavior.dart';
import 'package:flutter/material.dart';

class AnimateRotationOnStart extends StatefulWidget {
  const AnimateRotationOnStart({
    Key? key,
    required this.child,
    this.rotateAnimateDuration = const Duration(seconds: 1),
    this.rotateFirstValue = 0,
    this.rotateSecondValue = 1,
    this.curve = Curves.easeInOut,
    this.onAnimationEnd,
    this.isRepeat = false,
  }) : super(key: key);

  final Duration rotateAnimateDuration;
  final Widget child;
  final Curve curve;
  final Function()? onAnimationEnd;
  final double rotateFirstValue;
  final double rotateSecondValue;
  final bool isRepeat;

  @override
  AutoStartBehavior<AnimateRotationOnStart> createState() =>
      // ignore: no_logic_in_create_state
      _AnimateRotationOnStartState(
          isRepeat: isRepeat, duration: rotateAnimateDuration);
}

class _AnimateRotationOnStartState
    extends AutoStartBehavior<AnimateRotationOnStart> {
  _AnimateRotationOnStartState(
      {required bool isRepeat, required Duration duration})
      : super(isRepeat: isRepeat, duration: duration);

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
