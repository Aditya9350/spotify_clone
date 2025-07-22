
import 'package:flutter/material.dart';

import '../Login_Screen/enter_email_screen.dart';
import '../common_widgets/custom_app_logo.dart';
import '../common_widgets/my_custom_Btn_round.dart';
import '../constants/color_files/app_colors.dart';
import '../constants/string_files/const_string.dart';

class SingUpDetailScreen extends StatelessWidget {
  const SingUpDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 300),
          CustomAppLogo(pathIcon: 'assets/spotify_icons/logo.svg', text1: ConstString.signUpStart,text2: ConstString.listening,),
          const Spacer(),
          MyCustomBtnRound(onTap: () {
            navigateTo(context, const EnterEmailScreen());
          }, text: ConstString.contWithEmail, borderStroke: false,iconPath: "assets/login_icons/email_logo.svg",iconColor: AppColors.black,bgColor: AppColors.green,textColor: AppColors.black,),
          const SizedBox(height: 15,),
          MyCustomBtnRound(onTap: () {  }, text: ConstString.contWithPhone, borderStroke: true,iconPath: "assets/login_icons/phone_logo.svg",iconColor: AppColors.white,bgColor: AppColors.transparent,),
          const SizedBox(height: 15,),
          MyCustomBtnRound(onTap: () {  }, text: ConstString.contWithGoogle, borderStroke: true,iconPath: "assets/login_icons/google.svg",iconColor: AppColors.white,bgColor:  AppColors.transparent,),
          const SizedBox(height: 25,),
          Text(ConstString.alreadyAccount,style: const TextStyle(color: AppColors.white,fontSize: 15,fontWeight: FontWeight.w400),),
          const SizedBox(height: 15,),
          InkWell(
            onTap: (){

            },
            child: Text(ConstString.loginWithSpace,style: const TextStyle(color: AppColors.white,fontSize: 15,fontWeight: FontWeight.w400))
          ),
          const SizedBox(height: 35,)
        ],
      ),
    );
  }
  void navigateTo<T extends Widget>(BuildContext context, T page) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> page));
  }
}
