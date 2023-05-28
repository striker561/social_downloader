import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: homeScreenAppbar(),
      ),
    );
  }
}

AppBar homeScreenAppbar() {
  return AppBar(
    title: const Text('Grabber'),
  );
}
