import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled1/constants/color_files/app_colors.dart';

class CustomArtistImage extends StatelessWidget {
  String imagePath;
  String artisName;
  bool isSvg;

  CustomArtistImage({
    super.key,
    required this.imagePath,
    required this.artisName,
    this.isSvg = false
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(radius: 40, child: isSvg ? SvgPicture.asset(imagePath,fit: BoxFit.fill,) :Image.asset(imagePath)),
        SizedBox(height: 5),
        Text(
          artisName,
          style: TextStyle(
            height: 1,
            color: AppColors.white,
            fontSize: 12,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
