import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class PlayerList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PlayerListState();
  }
}

class PlayerListState extends State<PlayerList> {
  double m_height = 0;

  @override
  Widget build(BuildContext context) {
    final double statusBar = MediaQueryData.fromWindow(window).padding.top;
    final double topPadding = MediaQuery.of(context).padding.top;
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    final double screenHeight = MediaQuery.of(context).size.height;
    final height = screenHeight - bottomPadding - topPadding - statusBar;
    return SliverToBoxAdapter(
      child: SizedBox.fromSize(
        child: Align(
          alignment: Alignment.center,
          child: SizedBox.fromSize(
            size: Size(double.infinity, height * 0.6),
            child: Column(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                        child: Player(
                      username: "1号",
                      color: Colors.redAccent,
                      position: Position.EAST,
                    )),
                    Expanded(
                      child: Player(
                        username: "2号",
                        color: Colors.indigo,
                        position: Position.SOUTH,
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                      child: Player(
                        username: "3号",
                        color: Colors.amber[700],
                        position: Position.WEST,
                      ),
                    ),
                    Expanded(
                      child: Player(
                        username: "4号",
                        color: Colors.greenAccent[700],
                        position: Position.NORTH,
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
        size: Size(double.infinity, height),
      ),
    );
  }
}

class Player extends StatefulWidget {
  /// 姓名
  final String username;

  /// 背景颜色
  final Color color;

  /// 方位
  final Position position;

  /// 当前是否是庄家
  final bool bookmaker;

  const Player(
      {Key key,
      this.username,
      this.color,
      this.bookmaker = false,
      this.position})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PlayerState(username, color, bookmaker, position);
  }
}

class _PlayerState extends State {
  final String username;
  final Position position;
  bool bookmaker;
  Color color;

  _PlayerState(this.username, this.color, this.bookmaker, this.position);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r)),
                padding: EdgeInsets.all(10.r),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(15.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 20.h)),
                      Text(
                        username,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        position.toLabel(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              child: bookmaker
                  ? Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Color(0xFFFFFF00),
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Text(
                            " 庄家 ",
                            style: TextStyle(
                                shadows: [
                                  Shadow(color: Colors.white, blurRadius: 15.r)
                                ],
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.redAccent),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              top: 0,
              left: 0,
              right: 0,
            ),
          ],
        ),
      ),
    );
  }
}

// 位置
enum Position {
  EAST,
  SOUTH,
  WEST,
  NORTH,
}

extension PositionExtension on Position {
  String toLabel() {
    switch (this) {
      case Position.EAST:
        return "东";
      case Position.SOUTH:
        return "南";
      case Position.WEST:
        return "西";
      case Position.NORTH:
        return "北";
      default:
        return "";
    }
  }
}
