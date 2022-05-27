import 'package:flutter/material.dart';

abstract class AutoStartBehavior<T extends StatefulWidget> extends State<T>
    with SingleTickerProviderStateMixin {
  AutoStartBehavior({required this.isRepeat, required this.duration});

  bool isRepeat;

  late AnimationController _controller;
  get animateController => _controller;

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

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
