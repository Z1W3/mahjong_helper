import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class DiceLayout extends StatefulWidget {
  DiceLayout({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DiceState();
  }
}

class DiceState extends State<DiceLayout> {
  GlobalKey<DiceAnimationState> rollKey = new GlobalKey();
  String rollBtnLabel = "请庄家投掷";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Stack(
          children: [
            Positioned(
              child: DiceAnimation(
                key: rollKey,
                function: (count, rollNum) {
                  sss(count, rollNum);
                },
              ),
              left: 0,
              right: 0,
            ),
            Positioned(
              child: Padding(
                child: Ink(
                  height: 100.h,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(30.r)),
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(30.r)),
                    onTap: () {
                      rollKey.currentState.random();
                    },
                    splashColor: Colors.deepOrange,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        rollBtnLabel,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 60.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                padding: EdgeInsets.only(left: 30.w, right: 30.w),
              ),
              left: 0,
              right: 0,
              bottom: 30.h,
            ),
          ],
        ),
      ),
    );
  }

  void sss(int count, int rollNum) {
    setState(() {
      if (rollNum != null) {
        if (count == 1) {
          switch (rollNum % 4) {
            case 1:
              rollBtnLabel = "请庄家自手";
              break;
            case 2:
              rollBtnLabel = "庄家下家投掷";
              break;
            case 3:
              rollBtnLabel = "庄家对家投掷";
              break;
            case 4:
              rollBtnLabel = "庄家上家投掷";
              break;
          }
        }
        else if(count == 2) {
          rollBtnLabel = "重置投掷";
        }
        else {
          rollBtnLabel = "请庄家投掷";
        }
      }
    });
  }
}

class DiceAnimation extends StatefulWidget {
  final void Function(int count, int rollNum) function;

  DiceAnimation({Key key, @required this.function}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DiceAnimationState(function);
  }
}

class DiceAnimationState extends State<DiceAnimation> {
  int _rollNum;
  int _count = 0;
  int recordRoll = 0;
  int _maxGroupCard = 17;
  void Function(int count, int rollNum) function;

  DiceAnimationState(this.function);

  int getCount() => _count;

  void random() {
    setState(() {
      ++_count;
      int next(int min, int max) => min + Random.secure().nextInt(max - min);
      _rollNum = next(2, 13);
      function(_count, _rollNum);
      recordRoll += _rollNum;
      if (_count > 2) {
        _count = 0;
        recordRoll = 0;
        _rollNum = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                _getRollLabel(),
                style: TextStyle(
                    fontSize: 60.sp,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w800),
              ),
              Text(
                _rollNum != null ? "$_rollNum" : "",
                style: TextStyle(
                    fontSize: 160.sp,
                    color: Colors.teal,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                _rollNum != null ? "点" : "",
                style: TextStyle(
                    fontSize: 60.sp,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w800),
              )
            ],
          ),
          Row(
            children: [
              Text(
                _count == 2 ? "共投" : "",
                style: TextStyle(
                    fontSize: 60.sp,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w800),
              ),
              Text(
                _count == 2 ? "$recordRoll" : "",
                style: TextStyle(
                    fontSize: 160.sp,
                    color: Colors.teal,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                _count == 2 ? "点" : "",
                style: TextStyle(
                    fontSize: 60.sp,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w800),
              )
            ],
          ),

          _count == 2 ?
          SizedBox.fromSize(
            child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey[400])),
            size: Size(double.infinity, 1.h),
          ) : Container(),
          Text(
            _count == 2 ? _aa() : "",
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 70.sp,
                color: Colors.redAccent,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  String _getRollLabel() {
    switch (_count) {
      case 1:
        return "第一投:";
      case 2:
        return "第二投:";
      default:
        return "";
    }
  }

  String _aa() {
    int rem = recordRoll % _maxGroupCard;
    if (recordRoll == _maxGroupCard) {
      return "满贯";
    } else if (recordRoll > _maxGroupCard) {
      return "抓二过${rem}";
    } else {
      switch (rem) {
        case 16:
          return "两头凑";
        case 15:
          return "一头堵";
        case 14:
          return "抓二剩一";
        case 13:
          return "两把抓干";
        case 12:
          return "抓二剩三";
        case 11:
          return "抓二剩四";
        case 10:
          return "抓二剩五";
        default:
          return "从右往左\n数$rem墩";
      }
    }
  }
}
