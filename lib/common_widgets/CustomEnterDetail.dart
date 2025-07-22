import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/color_files/app_colors.dart';

class CustomEnterDetail extends StatelessWidget {
  final TextEditingController controller;
  String textHeader;
  String textInfo;
  Color headerColor;
  Color infoColor;
  Color bgTextFiled;
  String? iconPath;
  Color iconColor;

  CustomEnterDetail(
      {super.key,
      required this.controller,
      required this.textHeader,
      required this.textInfo,
      this.iconPath,
      required this.bgTextFiled,
      this.headerColor = Colors.white,
      this.infoColor = Colors.white,
      this.iconColor = Colors.black87});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textHeader,
          textAlign: TextAlign.start,
          style: TextStyle(
              color: headerColor, fontWeight: FontWeight.bold, fontSize: 35),
        ),
        const SizedBox(
          height: 5,
        ),
        iconPath != null
            ? passwordTextField(iconPath!, iconColor)
            : TextFormField(
                controller: controller,
                obscureText: false,
                cursorColor: AppColors.white,
                style: TextStyle(color: headerColor, fontSize: 15),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: bgTextFiled,
                ),
              ),
        const SizedBox(
          height: 5,
        ),
        if (textInfo.isNotEmpty)
          Text(
            textInfo,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.normal, color: infoColor),
          )
      ],
    );
  }

  Widget passwordTextField(String filePath, Color iconColor) {
    return Row(
      children: [
        TextFormField(
          controller: controller,
          style: const TextStyle(color: AppColors.white, fontSize: 15),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            suffixIcon: GestureDetector(
              child: SvgPicture.asset(
                filePath,
                color: iconColor,
                width: 10,
                height: 10,
              ),
            ),
            filled: true,
            fillColor: AppColors.lightBlack,
            enabled: false,
          ),
        ),
      ],
    );
  }
}
