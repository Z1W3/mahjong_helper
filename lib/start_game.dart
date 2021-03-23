import 'package:flutter/material.dart';
import 'package:main/dice.dart';
import 'package:main/player_layout.dart';
import 'package:flutter_screenutil/size_extension.dart';

class StartGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: GameProgress(),),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 20.h)),
            PlayerList(),
            Padding(padding: EdgeInsets.only(top: 20.h)),
            DiceLayout(),
          ],
        ),
      ),
    );
  }
}

class GameProgress extends StatefulWidget{
  final GameProgressStatus gameProgressStatus;

  const GameProgress({Key key, this.gameProgressStatus}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GameProgressState(gameProgressStatus);
  }
}

class _GameProgressState extends State<GameProgress>{
  GameProgressStatus gameProgressStatus;


  _GameProgressState(this.gameProgressStatus);

  @override
  Widget build(BuildContext context) {
    return Text(gameProgressStatus.toLabel());
  }

}



enum GameProgressStatus{
  /// 投骰子选出庄家
  ROLL_DICE_SELECT_BOOKMAKER,
  /// 投骰子抓牌
  ROLL_DICE_FETCH_CARD,

}

extension GameProgressStatusExtension on GameProgressStatus{
  String toLabel(){
    switch(this){
      case GameProgressStatus.ROLL_DICE_SELECT_BOOKMAKER:
        return "扔骰子摸东";
      case GameProgressStatus.ROLL_DICE_FETCH_CARD:
        return "扔骰子抓拍";
      default:
        return "游戏进行中";
    }
  }
}