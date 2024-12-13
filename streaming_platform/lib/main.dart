import 'package:flutter/material.dart';

import 'home/presentation/widgets/bottom_nav_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media App',
      theme: ThemeData.dark(),
      home: BottomNavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

