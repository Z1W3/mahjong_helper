import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:main/player_layout.dart';
import 'package:flutter_screenutil/size_extension.dart';

class StartGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: StartGameLayout(),
      ),
    );
  }
}

class StartGameLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StartGameState();
  }
}

class _StartGameState extends State<StartGameLayout> {
  double _margin = 0.0;
  PageController pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(milliseconds: 300), (){
    //   final double statusBar = MediaQueryData.fromWindow(window).padding.top;
    //   final double topPadding = MediaQuery.of(context).padding.top;
    //   final double bottomPadding = MediaQuery.of(context).padding.bottom;
    //   final double screenHeight = MediaQuery.of(context).size.height;
    //   final pageHeight = screenHeight - bottomPadding - topPadding - statusBar;
    //   return ((pageHeight - globalKey.currentContext.size.height) / 2.0);
    // }).then((value) => setState(() {
    //   _margin = value;
    // }));
    return CustomScrollView(
      controller: pageController,
      physics: PageScrollPhysics(),
      slivers: [
        PlayerList(),
        PlayerList(),
      ],
    );
  }
}
