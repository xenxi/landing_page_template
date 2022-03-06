import 'package:flutter/material.dart';
import 'package:landing_page_template/presentation/views/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const HomeView(),
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
