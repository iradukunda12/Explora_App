

import 'package:flutter/cupertino.dart';

class MediaSelectorNavigator extends StatefulWidget {
  const MediaSelectorNavigator({super.key});

  @override
  State<MediaSelectorNavigator> createState() => _MediaSelectorNavigatorState();
}

class _MediaSelectorNavigatorState extends State<MediaSelectorNavigator> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Media Selector"),
    );
  }
}
