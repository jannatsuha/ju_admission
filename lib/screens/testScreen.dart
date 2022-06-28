import 'package:flutter/material.dart';
class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: _handleMenuButtonPressed,
        //   icon: ValueListenableBuilder<AdvancedDrawerValue>(
        //     valueListenable: _advancedDrawerController,
        //     builder: (_, value, __) {
        //       return AnimatedSwitcher(
        //         duration: Duration(milliseconds: 250),
        //         child: Icon(
        //           value.visible ? Icons.clear : Icons.menu,
        //           key: ValueKey<bool>(value.visible),
        //         ),
        //       );
        //     },
        //   ),
        // ),
      ),
    );
  }
}
