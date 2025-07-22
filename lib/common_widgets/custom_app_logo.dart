import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomAppLogo extends StatelessWidget {
  String pathIcon;
  String text1;
  String? text2;
  Color iconColor;
  Color text1Color;
  Color text2Color;

  CustomAppLogo({super.key, 
   required this.pathIcon, 
    required this.text1,
    this.text2,
    this.iconColor = Colors.white,
    this.text1Color = Colors.white,
    this.text2Color = Colors.white
});
  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          children: [
            SvgPicture.asset(pathIcon,width: 80,height: 80,color: iconColor,),
            const SizedBox(height: 15,),
            Text(text1, style: TextStyle(color: text1Color, fontSize: 30, fontWeight: FontWeight.bold,
            )),
            const SizedBox(height: 5,),
           if(text2!=null)
             Text(text2!, style: TextStyle(color: text2Color,fontSize: 30,fontWeight: FontWeight.bold),)
          ],
      ),
    );
  }
}
