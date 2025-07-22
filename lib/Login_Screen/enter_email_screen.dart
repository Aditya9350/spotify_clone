import 'package:flutter/material.dart';

import '../common_widgets/CustomEnterDetail.dart';
import '../common_widgets/my_custom_Btn_round.dart';
import '../constants/color_files/app_colors.dart';
import '../constants/string_files/const_string.dart';
import 'enter_password_screen.dart';

class EnterEmailScreen extends StatefulWidget {
  const EnterEmailScreen({super.key});

  @override
  State<EnterEmailScreen> createState() => _EnterEmailScreenState();
}

class _EnterEmailScreenState extends State<EnterEmailScreen> {
  final TextEditingController _controller = TextEditingController();
  bool isValidEmail = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      isValidEmail = validateEmail(_controller.text);
      if (isValidEmail) {
        setState(() {
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool validateEmail(String userEMail) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(userEMail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlack,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        leading: const Icon(
          Icons.arrow_back,
          color: AppColors.white,
          size: 25,
        ),
        centerTitle: true,
        title: const Text(
          "Create account",
          style: TextStyle(
              color: AppColors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomEnterDetail(
                controller: _controller,
                textHeader: ConstString.enterEmail,
                textInfo: ConstString.verifyEmail,
                bgTextFiled: AppColors.lightBlack),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: MyCustomBtnRound(
                onTap: () {
                  isValidEmail ? validateNextScreen() : null;
                },
                text: ConstString.loginButton,
                borderStroke: false,
                bgColor:
                    isValidEmail ? AppColors.lightWhite : AppColors.lightBlack,
                width: 80,
                height: 40,
                textSize: 16,
                textColor: AppColors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  void validateNextScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const EnterPasswordScreen()));
  }
  
  Widget passwordWidget(){
    return Scaffold(
      backgroundColor: AppColors.darkBlack,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        leading: const Icon(
          Icons.arrow_back,
          color: AppColors.white,
          size: 25,
        ),
        centerTitle: true,
        title: const Text(
          "Create account",
          style: TextStyle(
              color: AppColors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomEnterDetail(
                controller: _controller,
                textHeader: ConstString.createPassword,
                textInfo: ConstString.lengthPassword,
                bgTextFiled: AppColors.lightBlack),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: MyCustomBtnRound(
                onTap: () {
                  // _isValid ? validateNextScreen(userInfo) : null;
                },
                text: ConstString.loginButton,
                borderStroke: false,
                bgColor: true ? AppColors.lightWhite : AppColors.lightBlack,
                width: 80,
                height: 40,
                textSize: 16,
                textColor: AppColors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
  
  Widget genderSelectionWidget(){
    return Scaffold(
      backgroundColor: AppColors.darkBlack,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        leading: const Icon(
          Icons.arrow_back,
          color: AppColors.white,
          size: 25,
        ),
        centerTitle: true,
        title: const Text(
          "Create account",
          style: TextStyle(
              color: AppColors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomEnterDetail(
                controller: _controller,
                textHeader: ConstString.gender,
                textInfo: ConstString.verifyEmail,
                bgTextFiled: AppColors.lightBlack),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: MyCustomBtnRound(
                onTap: () {
                  // isValidEmail ? validateNextScreen(_userInfo) : null;
                },
                text: ConstString.loginButton,
                borderStroke: false,
                bgColor: AppColors.lightBlack,
                width: 80,
                height: 40,
                textSize: 16,
                textColor: AppColors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
