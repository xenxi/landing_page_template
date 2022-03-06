import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.red,
          ),
          Positioned(
              top: 20,
              right: 20,
              child: Container(
                width: 100,
                height: 50,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
