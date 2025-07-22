import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/color_files/app_colors.dart';

class MyCustomBtnRound extends StatelessWidget {
  VoidCallback onTap;
  double width;
  double height;
  Color bgColor;
  String text;
  Color textColor;
  String? iconPath;
  Color? iconColor;
  bool borderStroke;
  double textSize;
  Color strokeColor;


  MyCustomBtnRound({super.key,
    required this.onTap,
    required this.text,
    this.textColor = Colors.white,
    this.iconPath,
    this.iconColor = Colors.white,
    this.width = 300,
    this.height = 50,
    this.bgColor = Colors.white,
    this.textSize = 16,
    required this.borderStroke,
    this.strokeColor = AppColors.lightWhite});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: borderStroke ? Border.all(color:strokeColor, width: 1) : Border.all(
              width: 0),
          color: borderStroke ? Colors.transparent : bgColor,
        ), child: iconPath != null ? Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: SvgPicture.asset(iconPath!, width: 25, height: 25,),
          ),
          Expanded(child: Center(child: Text(text, style: TextStyle(
              color: textColor,
              fontSize: textSize,
              fontWeight: FontWeight.normal),),))
        ],
      ) : Center(
        child: Text(text, style: TextStyle(color: textColor,
            fontSize: textSize,
            fontWeight: FontWeight.bold),),
      ),
      ),
    );
  }
}

