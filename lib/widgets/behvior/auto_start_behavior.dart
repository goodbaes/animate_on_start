import 'package:flutter/material.dart';

abstract class AutoStartBehavior<T extends StatefulWidget> extends State<T>
    with SingleTickerProviderStateMixin {
  AutoStartBehavior({
    required this.isRepeat,
    required this.duration,
    this.onStart,
    this.onEnd,
  });

  bool isRepeat;

  late AnimationController _controller;
  get animateController => _controller;

  final Function()? onStart, onEnd;

  final Duration duration;

  @override
  void initState() {
    _controller = AnimationController(
      duration: duration,
      vsync: this,
    );
    if (isRepeat) {
      _controller.repeat();
    } else {
      _controller.forward();
    }
    _controller.addListener(() {
      if (_controller.status == AnimationStatus.forward) {
        onStart?.call();
      }
      if (_controller.status == AnimationStatus.completed) {
        onEnd?.call();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
