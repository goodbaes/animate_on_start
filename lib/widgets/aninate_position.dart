import 'package:animate_on_start/widgets/behvior/auto_start_behavior.dart';
import 'package:flutter/material.dart';

class CustomAnimatePosition extends StatefulWidget {
  const CustomAnimatePosition({
    Key? key,
    this.leftFinish = 0,
    this.leftInit = 0,
    this.rightFinish = 0,
    this.rightInit = 0,
    this.topFinish = 0,
    this.topInit = 0,
    this.bottomFinish = 0,
    this.bottomInit = 0,
    this.onAnimationEnd,
    this.onAnimationStart,
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

  final Function()? onAnimationEnd;
  final Function()? onAnimationStart;

  @override
  AutoStartBehavior<CustomAnimatePosition> createState() =>
      // ignore: no_logic_in_create_state
      _CustomAnimatePositionState(
          isRepeat: false, duration: positionAnimateDuration);
}

class _CustomAnimatePositionState
    extends AutoStartBehavior<CustomAnimatePosition> {
  _CustomAnimatePositionState(
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
