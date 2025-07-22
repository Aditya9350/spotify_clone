import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled1/constants/color_files/app_colors.dart';

class Utility {
  static InputDecoration getSearchFiledDecoration(Color bgColor,
      String hintText,
      IconData iconData,) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: bgColor,
      hintText: hintText,
      hintStyle: TextStyle(
        color: AppColors.black,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      prefixIcon: Icon(iconData, size: 25,),
      prefixIconColor: AppColors.black,
    );
  }

  static Widget getCircleOrCornerContainer(String headerText,
      Color textColor,
      Color bg,
      bool isCircle,
      double textSize,
      bool borderStroke,) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: isCircle
          ? BoxDecoration(
        shape: BoxShape.circle,
        color: bg,
        border: borderStroke
            ? Border.all(color: AppColors.black,
            width: .6,
            strokeAlign: BorderSide.strokeAlignCenter)
            : null,
      )
          : BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: borderStroke
            ? Border.all(color: AppColors.black,
            width: .6,
            strokeAlign: BorderSide.strokeAlignCenter)
            : null,
      ),
      child: Text(
        headerText,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w400,
          fontSize: textSize,
        ),
      ),
    );
  }


  static CircleAvatar getCircleAvatar(String userName,
      Color textColor) {
    return CircleAvatar(
      radius: 14,
      child: Text(userName,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: textColor),),);
  }


  static Widget getImageWidget(String imagePath,
      double width,
      double height,
    Color imageColor,
      Color bg,
    ) {
    return SvgPicture.asset(imagePath, width: width,
      height: height,
      alignment: Alignment.center,
      color: imageColor,
      colorFilter: ColorFilter.mode(bg, BlendMode.src),);
  }
}
