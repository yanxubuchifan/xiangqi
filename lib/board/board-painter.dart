import 'package:chessroad/common/color-consts.dart';
import 'package:flutter/material.dart';

import 'board-widget.dart';

class BoardPainter extends CustomPainter {
  // 棋盘的宽度， 横盘上线格的总宽度，每一个格子的边长
  final double width, gridWidth, squareSide;
  final thePaint = Paint();

  static doPaint(Canvas canvas,Paint paint,double gridWidth,double squareSide,{double offsetX,double offsetY}){

    paint.color = ColorConsts.BoardLine;
    paint.style = PaintingStyle.stroke;

    var left = offsetX, top = offsetY;

    // 外框
   paint.strokeWidth = 2;
   canvas.drawRect(
     Rect.fromLTWH(left, top, gridWidth, squareSide * 9),
     paint,
  );
  // 中轴线
   paint.strokeWidth = 1;
   canvas.drawLine(
     Offset(left + gridWidth / 2, top),
     Offset(left + gridWidth / 2, top + squareSide * 9),
     paint,
  );
  // 8 根中间的横线
   for (var i = 1; i < 9; i++) {
     canvas.drawLine(
       Offset(left, top + squareSide * i),
       Offset(left + gridWidth, top + squareSide * i),
       paint,
    );
  }
  // 上下各6根短竖线
   for (var i = 0; i < 8; i++) {
     //
     if (i == 4) continue; // 中间拉通的线已经画过了

     canvas.drawLine(
       Offset(left + squareSide * i, top),
       Offset(left + squareSide * i, top + squareSide * 4),
       paint,
    );
     canvas.drawLine(
       Offset(left + squareSide * i, top + squareSide * 5),
       Offset(left + squareSide * i, top + squareSide * 9),
       paint,
    );
  }
  

  }

  BoardPainter({@required this.width})
      : gridWidth = (width - BoardWidget.Padding * 2) * 8 / 9,
        squareSide = (width - BoardWidget.Padding * 2) / 9;

  @override
  void paint(Canvas canvas, Size size) {
    //
    doPaint(canvas, thePaint, gridWidth, squareSide,offsetX: BoardWidget.Padding+squareSide/2,offsetY: BoardWidget.Padding + BoardWidget.DigitsHeight+squareSide/2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}