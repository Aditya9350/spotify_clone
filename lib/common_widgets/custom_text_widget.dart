import 'package:flutter/cupertino.dart';

class CustomTextWidget extends StatelessWidget {
  String text;
  double textSize;
  Color textColor;
  FontWeight? fontWeight;
  int? maxLines;


  CustomTextWidget(
      {super.key, required this.text,
        required this.textSize,
        required this.textColor,
        this.fontWeight = FontWeight.w400,
        this.maxLines = 1

      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text, style: TextStyle(color: textColor, fontSize: textSize, fontWeight: fontWeight,height: 1),
     maxLines: maxLines,
    );
  }
}
