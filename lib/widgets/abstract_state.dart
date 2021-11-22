import 'dart:async';

import 'package:flutter/material.dart';

abstract class StateCustomInit<T extends StatefulWidget> extends State<T> {
  @override
  initState() {
    initAnimation();
    super.initState();
  }

  bool init = false;

  initAnimation() {
    Timer(
      Duration.zero,
      () => setState(() => init = true),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
