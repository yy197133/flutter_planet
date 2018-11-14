import 'package:flutter/material.dart';



class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 66.0;


  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      height: barHeight + statusBarHeight,
      decoration: new BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xff3366ff),
            const Color(0xff00ccff)
          ],
//          stops: [0.0, 1.0],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          tileMode: TileMode.clamp
        ),
      ),
      child: new Center(
        child: new Text(
          title,
          style: new TextStyle(
            color: Colors.white,
//            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 36.0
          ),
        ),
      ),
    );

  }

}