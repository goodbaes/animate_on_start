import 'package:animate_on_start/widgets/behvior/auto_start_behavior.dart';
import 'package:flutter/material.dart';

class AnimateRotationOutIn extends StatefulWidget {
  const AnimateRotationOutIn({
    Key? key,
    this.leftFinish = 0,
    this.leftInit = 0,
    this.rightFinish = 0,
    this.rightInit = 0,
    this.topFinish = 0,
    this.topInit = 0,
    this.bottomFinish = 0,
    this.bottomInit = 0,
    this.curve,
    required this.child,
    this.positionAnimateDuration = Duration.zero,
  }) : super(key: key);

  final double leftFinish;
  final double leftInit;
  final double rightFinish;
  final double rightInit;
  final Duration positionAnimateDuration;
  final Curve? curve;
  final double topFinish;
  final double topInit;
  final double bottomFinish;
  final double bottomInit;
  final Widget child;

  @override
  AutoStartBehavior<AnimateRotationOutIn> createState() =>
      // ignore: no_logic_in_create_state
      _AnimateRotationOutInState(
          isRepeat: false, duration: positionAnimateDuration);
}

class _AnimateRotationOutInState
    extends AutoStartBehavior<AnimateRotationOutIn> {
  _AnimateRotationOutInState(
      {required bool isRepeat, required Duration duration})
      : super(isRepeat: isRepeat, duration: duration);

  @override
  Widget build(BuildContext context) {
    return PositionedTransition(
        rect: RelativeRectTween(
                begin: RelativeRect.fromLTRB(widget.leftInit, widget.topInit,
                    widget.rightInit, widget.bottomInit),
                end: RelativeRect.fromLTRB(widget.leftFinish, widget.topFinish,
                    widget.rightFinish, widget.bottomFinish))
            .animate(CurvedAnimation(
          parent: animateController,
          curve: widget.curve ?? Curves.easeInOut,
        )),
        child: widget.child);
  }
}
