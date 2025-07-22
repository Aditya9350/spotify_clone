import 'dart:async';
import 'package:flutter/material.dart';
import '../common_widgets/my_custom_Btn_round.dart';
import '../constants/color_files/app_colors.dart';
import '../constants/string_files/const_string.dart';
import 'date_birth_screen.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  // Keep track of selected button
  String selectedGender = "";

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });

    selectedInputDelay();
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
            Text(
              ConstString.gender,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 35),
            ),
            const SizedBox(height: 20),
            Row(
              spacing: 10,
              children: [
                buildGenderButton("Female",90,40),
                buildGenderButton("Male",70,40),
                buildGenderButton("Non-binary",120,40),

              ],
            ),
            SizedBox(height: 10,),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildGenderButton("Other", 80,40),
                buildGenderButton("Prefer not to say",160,40),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildGenderButton(String gender,double width, double height) {
    return IntrinsicWidth(
      child: MyCustomBtnRound(
        onTap: () => selectGender(gender),
        text: gender,
        borderStroke: true,
        bgColor: selectedGender == gender ? AppColors.white : AppColors.lightBlack,
        width: width,
        height: height,
        textSize: 16,
        textColor: selectedGender == gender ? AppColors.white : AppColors.lightWhite,
      ),
    );
  }


  void selectedInputDelay() {
    Timer(const Duration(seconds: 1), validateNextScreen);
  }

  void validateNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => DateBirthScreen()),
    );
  }
}
