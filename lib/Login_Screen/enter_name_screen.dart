import 'package:flutter/material.dart';
import 'package:untitled1/Login_Screen/select_artist_screen.dart';
import 'package:untitled1/common_widgets/CustomEnterDetail.dart';
import 'package:untitled1/common_widgets/my_custom_Btn_round.dart';
import 'package:untitled1/constants/string_files/const_string.dart';

import '../constants/color_files/app_colors.dart';

class EnterNameScreen extends StatefulWidget {
  const EnterNameScreen({super.key});

  @override
  State<EnterNameScreen> createState() => _EnterNameScreenState();
}

class _EnterNameScreenState extends State<EnterNameScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isselctedValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlack,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        leading: InkWell(
          onTap: () {
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
        padding: const EdgeInsets.only(left: 15.0,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomEnterDetail(
              controller: _controller,
              textHeader: ConstString.enterName,
              textInfo: ConstString.spotifyProfile,
              bgTextFiled: AppColors.lightBlack,
            ),
            SizedBox(height: 15,),
            Divider(
              height: 2,
              color: AppColors.lightWhite,
            ),
            SizedBox(height: 15,),
            Text(ConstString.agreeWithSpotify,style: TextStyle(color: AppColors.white,fontSize: 10),),
            SizedBox(height: 15,),
            Text(ConstString.termsUse,style: TextStyle(color: AppColors.green,fontSize: 12),),
            SizedBox(height: 15,),
            Text(ConstString.agreeWithSpotify,style: TextStyle(color: AppColors.white,fontSize: 10),),
            SizedBox(height: 15,),
            Text(ConstString.policy,style: TextStyle(color: AppColors.green,fontSize: 12),),
            SizedBox(height: 15,),
            Text(ConstString.marketing,style: TextStyle(color: AppColors.white,fontSize: 10),),
            SizedBox(height: 15,),
           RadioListTile.adaptive(
               controlAffinity: ListTileControlAffinity.trailing,
               title :Text(ConstString.spotifyOffer,style: TextStyle(color: AppColors.white,fontSize: 10),),
               value: false,
               groupValue: _isselctedValue,
               onChanged: (isChanged){
             
           }),
            SizedBox(height: 15,),
            RadioListTile.adaptive(
              controlAffinity: ListTileControlAffinity.trailing,
                title :Text(ConstString.marketing,style: TextStyle(color: AppColors.white,fontSize: 10),),
                value: false,
                groupValue: _isselctedValue,
                onChanged: (isChanged){

                }),
            Spacer(),
            Center(
              child: MyCustomBtnRound(
                width: 200,
                height: 50,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (contex) => SelectArtistScreen()));
                },
                  text: ConstString.anAcount,
                  borderStroke: false,
              textColor: Colors.black,),
            ),
            SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}
