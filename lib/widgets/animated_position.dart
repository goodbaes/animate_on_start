import 'package:animate_on_start/widgets/abstract_state.dart';
import 'package:flutter/material.dart';

class CustomAnimateOutIn extends StatefulWidget {
  const CustomAnimateOutIn({
    Key? key,
    this.leftFinish,
    this.leftInit,
    this.rightFinish,
    this.rightInit,
    this.topFinish,
    this.topInit,
    this.bottomFinish,
    this.bottomInit,
    required this.child,
    this.positionAnimateDuration = Duration.zero,
  }) : super(key: key);
  final double? leftFinish;
  final double? leftInit;
  final double? rightFinish;
  final double? rightInit;
  final Duration positionAnimateDuration;
  final double? topFinish;
  final double? topInit;
  final double? bottomFinish;
  final double? bottomInit;
  final Widget child;

  @override
  StateCustomInit<CustomAnimateOutIn> createState() =>
      _CustomAnimateOutInState();
}

class _CustomAnimateOutInState extends StateCustomInit<CustomAnimateOutIn> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: widget.positionAnimateDuration,
        curve: Curves.easeInOut,
        left: init ? widget.leftFinish : widget.leftInit,
        right: init ? widget.rightFinish : widget.rightInit,
        top: init ? widget.topFinish : widget.topInit,
        bottom: init ? widget.bottomFinish : widget.bottomInit,
        child: widget.child);
  }
}
