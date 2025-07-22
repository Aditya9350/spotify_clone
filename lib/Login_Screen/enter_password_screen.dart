
import 'package:flutter/material.dart';
import 'package:untitled1/Login_Screen/gender_selection_screen.dart';

import '../common_widgets/CustomEnterDetail.dart';
import '../common_widgets/my_custom_Btn_round.dart';
import '../constants/color_files/app_colors.dart';
import '../constants/string_files/const_string.dart';

class EnterPasswordScreen extends StatefulWidget {
   const EnterPasswordScreen({super.key});

  @override
  State<EnterPasswordScreen> createState() => _EnterPasswordScreenState();
}

class _EnterPasswordScreenState extends State<EnterPasswordScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isValid = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      String userPassword = _controller.text;
      if (userPassword.length > 6) {
        setState(() {
          _isValid = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlack,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back, color: AppColors.white, size: 25),
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
                  _isValid ? validateNextScreen(context) : null;
                },
                text: ConstString.loginButton,
                borderStroke: false,
                bgColor: _isValid ? AppColors.lightWhite : AppColors.lightBlack,
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

  void validateNextScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => GenderSelectionScreen()));
  }

// Function to validate the password
/* bool _validatePassword(String password) {
    // Reset error message
    _errorMessage = '';

    // Password length greater than 6
    if (password.length <6) {
      _errorMessage += 'Password must be longer than 6 characters.\n';
    }

    // Contains at least one uppercase letter
    if (!password.contains(RegExp(r'[A-Z]'))) {
      _errorMessage += '• Uppercase letter is missing.\n';
    }

    // Contains at least one lowercase letter
    if (!password.contains(RegExp(r'[a-z]'))) {
      _errorMessage += '• Lowercase letter is missing.\n';
    }

    // Contains at least one digit
    if (!password.contains(RegExp(r'[0-9]'))) {
      _errorMessage += '• Digit is missing.\n';
    }

    // Contains at least one special character
    if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
      _errorMessage += '• Special character is missing.\n';
    }

    // If there are no error messages, the password is valid
    return _errorMessage.isEmpty;
  } */
}
