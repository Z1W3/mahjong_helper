import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:main/start_game.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        title: '麻将辅助工具',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: SafeArea(
            child: StartGame(),
            // child: Align(
            //   alignment: Alignment(0.0, -0.3),
            //   child: SizedBox.fromSize(
            //     child: Align(
            //         alignment: Alignment.center,
            //         child: MainPage()
            //     ),
            //     size: Size(double.maxFinite, 700.h),
            //   ),
            // ),
          ),
        ),
      ),
      allowFontScaling: false,
      designSize: Size(750, 1334),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageStatus();
}

class _MainPageStatus extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: SizedBox.fromSize(
              child: Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "麻将辅助工具",
                    style: TextStyle(
                      color: Colors.green[800],
                      fontSize: 70.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              size: Size(double.maxFinite, 200.h),
            ),
          ),
          Expanded(
            child: Opacity(
              opacity: 0,
              child: Container(
                padding: EdgeInsets.only(left: 100.w, right: 100.w),
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox.fromSize(
                    child: Material(
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius:
                          BorderRadius.all(Radius.circular(30.r)),
                        ),
                        child: InkWell(
                          onTap: () {},
                          borderRadius:
                          BorderRadius.all(Radius.circular(30.r)),
                          splashColor: Colors.deepOrange,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "继续",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    size: Size(double.maxFinite, 100.h),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 100.w, right: 100.w),
            child: Material(
              child: Ink(
                height: 100.h,
                decoration: BoxDecoration(
                  color: Colors.cyan[900],
                  borderRadius:
                  BorderRadius.all(Radius.circular(30.r)),
                ),
                child: InkWell(
                  borderRadius:
                  BorderRadius.all(Radius.circular(30.r)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StartGame()));
                  },
                  splashColor: Colors.deepOrange,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "重新摸东",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
