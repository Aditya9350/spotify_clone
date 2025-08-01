
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled1/common_widgets/custom_text_widget.dart';
import 'package:untitled1/common_widgets/my_custom_Btn_round.dart';
import 'package:untitled1/constants/color_files/app_colors.dart';

class RecentPlaylistScreen extends StatefulWidget {
  const RecentPlaylistScreen({super.key});

  @override
  State<RecentPlaylistScreen> createState() => _RecentPlaylistScreenState();
}

class _RecentPlaylistScreenState extends State<RecentPlaylistScreen> {
  bool isMusicSelect = false;
  bool isPodcastSelect = false;
  bool isSavedSelect = false;
  bool isPlayedSelect = false;
  bool isCrossVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlack,
      body: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.brown,
              leading: Icon(Icons.arrow_back, size: 30, color: AppColors.white),
              pinned: true,
              centerTitle: true,
              title: CustomTextWidget(
                text: "Recents",
                textSize: 15,
                textColor: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: 45,
                child: Row(
                  children: [
                    if (isCrossVisible)
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 13,
                            backgroundColor: AppColors.lightBlack,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SvgPicture.asset(
                                'assets/media_icons/cross_icon.svg',
                                width: 15,
                                height: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),

                    Row(
                      children: [
                     MyCustomBtnRound(
                            onTap: () {
                              isCrossVisible = !isCrossVisible;
                              isMusicSelect = !isMusicSelect;
                              print("isSelcted ");
                              setState(() {});
                            },
                            text: "Music",
                            borderStroke: false,
                            textSize: 11,
                            bgColor: isMusicSelect
                                ? AppColors.green
                                : AppColors.lightBlack,
                            width: 55,
                            height: 30,
                            textColor: AppColors.darkBlack,
                          ),
 Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: MyCustomBtnRound(
                              onTap: () {},
                              text: "Podcast",
                              textSize: 11,
                              borderStroke: false,
                              bgColor: isPodcastSelect
                                  ? AppColors.green
                                  : AppColors.lightBlack,
                              width: 60,
                              height: 30,
                            ),
                          ),

                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: MyCustomBtnRound(
                              onTap: () {},
                              text: "Saved",
                              textSize: 11,
                              borderStroke: false,
                              bgColor: AppColors.lightBlack,
                              width: 55,
                              height: 30,
                            ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: MyCustomBtnRound(
                              onTap: () {},
                              text: "Played",
                              textSize: 11,
                              borderStroke: false,
                              bgColor: AppColors.lightBlack,
                              width: 55,
                              height: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
