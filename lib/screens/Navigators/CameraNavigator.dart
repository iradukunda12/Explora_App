

import 'package:flutter/cupertino.dart';

class CameraNavigator extends StatefulWidget {
  const CameraNavigator({super.key});

  @override
  State<CameraNavigator> createState() => _CameraNavigatorState();
}

class _CameraNavigatorState extends State<CameraNavigator> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Camera"),
    );
  }
}
