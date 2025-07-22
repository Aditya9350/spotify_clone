import 'package:flutter/material.dart';
import '../constants/color_files/app_colors.dart';

class CommonHeaderDashboard extends StatelessWidget {
  final VoidCallback onTap;
  final String textHeader;
  final Color textColor;
  final Color bgColor;
  final bool isSelected;

  const CommonHeaderDashboard({
    super.key,
    required this.onTap,
    required this.textHeader,
    required this.isSelected,
    required this.bgColor,
    this.textColor = Colors.white,

  });

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = textHeader == "All" ? 15.0 : 10.0;


    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          border: textHeader=="Music" ? Border.all(
            color: Colors.lightBlueAccent,
            width: 2
          ): null,
        ) ,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 7),
        child: Text(
          textHeader,
          style: TextStyle(
            color: textColor,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
