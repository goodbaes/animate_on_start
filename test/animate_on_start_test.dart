import 'package:animate_on_start/widgets/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  const MaterialApp(
    home: Scaffold(
        body: AnimateRotationOnStart(
      child: Text('data'),
    )),
  );
}
