import 'package:flutter/material.dart';

import '../Widgets/BottomAppBarWidget.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Text(
          "This Feature is Coming Soon!",
          style: TextStyle(
            color: Colors.green,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBarWidget(),
    );
  }
}
