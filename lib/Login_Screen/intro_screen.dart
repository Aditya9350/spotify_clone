import 'package:flutter/material.dart';
import '../common_widgets/custom_app_logo.dart';
import '../common_widgets/my_custom_Btn_round.dart';
import '../constants/color_files/app_colors.dart';
import '../constants/string_files/const_string.dart';
import '../login_service/login_detail_screen.dart';
import '../login_service/signup_detail_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlack,
      body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 300),
                CustomAppLogo(pathIcon:   "assets/spotify_icons/logo.svg", text1: ConstString.millionsSongs, text2:  ConstString.freeSong),
               const Spacer(),
                MyCustomBtnRound(
                  onTap: () {
                    navigateTo(context, const SingUpDetailScreen());
                  },
                  text: ConstString.signUp,
                  bgColor: AppColors.green,
                  textColor: AppColors.black,
                  borderStroke: false,
                ),
                const SizedBox(height: 15),
                MyCustomBtnRound(
                  onTap: () {
                    navigateTo(context, const LoginDetailScreen());
                  },
                  text: ConstString.login,
                  bgColor: Colors.transparent,
                  textColor: AppColors.white,
                  borderStroke: true,
                ),
                const SizedBox(height: 50,)
              ],
            ),
          ),
      ),
    );
  }
  void navigateTo<T extends Widget>(BuildContext context, T page) {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => page,
      ),
    );
  }
}
