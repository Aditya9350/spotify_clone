
import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:untitled1/Login_Screen/enter_name_screen.dart';

import '../common_widgets/my_custom_Btn_round.dart';
import '../constants/color_files/app_colors.dart';
import '../constants/string_files/const_string.dart';

class DateBirthScreen extends StatefulWidget {
  const DateBirthScreen({super.key});

  @override
  State<DateBirthScreen> createState() => _DateBirthScreenState();
}

class _DateBirthScreenState extends State<DateBirthScreen> {
  DateTime _selectedDate = DateTime.now();
  bool isValidAge = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ConstString.dateOfBirth,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 350,
              child: ScrollDatePicker(
                options: DatePickerOptions(
                  backgroundColor: AppColors.darkBlack,
                ),
                scrollViewOptions: DatePickerScrollViewOptions(
                  month: dateTimePicker(),
                  day: dateTimePicker(),
                  year: dateTimePicker(),
                ),
                selectedDate: _selectedDate,
                locale: const Locale('en'),
                onDateTimeChanged: (DateTime value) {
                  setState(() {
                    _selectedDate = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: MyCustomBtnRound(
                onTap: () {
                  ageValidate();
                },
                text: ConstString.loginButton,
                borderStroke: true,
                bgColor: AppColors.transparent,
                width: 80,
                height: 40,
                textSize: 16,
                textColor: AppColors.lightWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ScrollViewDetailOptions dateTimePicker() {
    return ScrollViewDetailOptions(
      textStyle: TextStyle(
        color: AppColors.white,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      selectedTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: AppColors.lightBlack,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.lightBlack,
        decorationThickness: 2,

      ),
    );
  }

  void ageValidate(){
    DateTime currentDate = DateTime.now();
    if(currentDate.year -_selectedDate.year>=15){
        validateNextScreen();
    } else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 2),
            content: Text('Age is not match with Spotify'),
          )
      );
    }
  }


  void validateNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => EnterNameScreen()),
    );
  }
}
