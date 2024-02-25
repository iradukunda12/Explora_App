

import 'package:flutter/cupertino.dart';

class PhoneNavigator extends StatefulWidget {
  const PhoneNavigator({super.key});

  @override
  State<PhoneNavigator> createState() => _PhoneNavigatorState();
}

class _PhoneNavigatorState extends State<PhoneNavigator> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Phone"),
    );
  }
}
