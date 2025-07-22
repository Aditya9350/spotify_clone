import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:untitled1/common_widgets/custom_text_widget.dart';
import 'package:untitled1/common_widgets/my_custom_Btn_round.dart';
import 'package:untitled1/constants/color_files/app_colors.dart';
import 'package:untitled1/constants/string_files/const_string.dart';

class PremiumScreen extends StatefulWidget {
  final ZoomDrawerController controller;

  const PremiumScreen({Key? key, required this.controller}) : super(key: key);

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.darkBlack,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 55.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.transparent,
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    SvgPicture.asset(
                      'assets/spotify_icons/logo.svg',
                      fit: BoxFit.fill,
                      color: Colors.white,
                    ),
                    // Optional gradient overlay for effect
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            AppColors.darkBlack,
                            AppColors.darkBlack.withOpacity(0.5),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(160),
                child: Container(
                  width: width,
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getRowWiget(30, 18),
                      const SizedBox(height: 8),
                      Opacity(
                        opacity: 0.95, // slightly faded for effect
                        child: Text(
                          ConstString.getMorePremium,
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: MyCustomBtnRound(
                        onTap: () {},
                        text: "Get Started",
                        borderStroke: false,
                        width: double.infinity,
                        textColor: AppColors.black,
                        textSize: 20,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      ConstString.premiumPlan,
                      style: TextStyle(color: AppColors.gray, fontSize: 13),
                    ),
                    SizedBox(height: 20),
                    // Why Premium Join
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: AppColors.black1,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 15,
                              left: 7,
                              right: 7,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextWidget(
                                text: ConstString.whyPremium,
                                textSize: 25,
                                textColor: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Divider(
                            height: 20,
                            color: AppColors.lightBlack,
                            thickness: 2,
                          ),
                          premiumRow(
                            'assets/media_icons/sound.png',
                            ConstString.freeAd,
                          ),
                          premiumRow(
                            'assets/media_icons/download.png',
                            ConstString.downloadP,
                          ),
                          premiumRow(
                            'assets/media_icons/Shuffle.png',
                            ConstString.shuffleP,
                          ),
                          premiumRow(
                            'assets/media_icons/headphone_icon.png',
                            ConstString.qualityAudioP,
                          ),
                          premiumRow(
                            'assets/media_icons/users.png',
                            ConstString.listenFrendsP,
                          ),
                          premiumRow(
                            'assets/media_icons/playlist_queue.png',
                            ConstString.organiseP,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 35),
                    // Available plans
                    CustomTextWidget(
                      text: ConstString.avlPlan,
                      textSize: 25,
                      textColor: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    getContainer(ConstString.avlPlan, AppColors.shade_light_red, '0', "119", [
                      '1Premium account',
                      'Cancel anytime',
                      'Subscribe or one-time payment',
                    ]),

                    getContainer(ConstString.family, AppColors.light_blue,'179', "179", [
                      'Up to 6 Premium account',
                      'Control content marked as explicit',
                      'Cancel anytime'
                          'Subscribe or one-time payment',
                    ]),

                    getContainer(ConstString.duo, AppColors.light_oragne,'149', "149", [
                      '2 Premium account',
                      'Cancel anytime',
                      'Subscribe or one-time payment',
                    ]),

                    getContainer(ConstString.student, AppColors.grayish_violet, '59', "59", [
                      '1 verified Premium account',
                      'Discount for eligible students',
                      'Cancel anytime',
                      'Subscribe or one-time payment',
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget premiumRow(String imagePath, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: 22,
              width: 22,
              alignment: Alignment.center,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 10),
            CustomTextWidget(text: text, textSize: 15, textColor: Colors.white),
          ],
        ),
      ),
    );
  }

  Row getRowWiget(double imageSize, double textSize) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/spotify_icons/logo.svg',
          height: imageSize,
          width: imageSize,
        ),
        const SizedBox(width: 5),
        Text(
          "Premium",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: textSize,
          ),
        ),
      ],
    );
  }

  Padding getPremiumSection(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.circle_sharp, size: 5, color: AppColors.white),
          SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget getContainer(
    String planType,
    Color planTypeColor,
    String subscriptionAmount,
    String subscriptionAmount1,
    List<String> planDetails,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.black1,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getRowWiget(18, 10),
            SizedBox(height: 10),
            CustomTextWidget(
              text: planType,
              textSize: 20,
              textColor: AppColors.shade_light_red,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10),
            CustomTextWidget(
              text: "\u{20B9}${subscriptionAmount} for 2 months",
              textSize: 16,
              textColor: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 5),
            CustomTextWidget(
              text: "\u{20B9}${subscriptionAmount1}/months after",
              textSize: 10,
              textColor: AppColors.gray,
              fontWeight: FontWeight.w400,
            ),
            Divider(height: 20, color: AppColors.lightBlack, thickness: 1),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                String planDetail = planDetails[index];
                return getPremiumSection(planDetail);
              },
              itemCount: planDetails.length,
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: MyCustomBtnRound(
                onTap: () {},
                text: "Try 4 month for \u{20B9}$subscriptionAmount",
                borderStroke: false,
                width: double.infinity,
                textColor: AppColors.black,
                textSize: 16,
                height: 40,
                bgColor: planTypeColor,
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: MyCustomBtnRound(
                onTap: () {},
                text: "one-time payments",
                borderStroke: true,
                width: double.infinity,
                textColor: AppColors.white,
                textSize: 16,
                height: 40,
                bgColor: AppColors.transparent,
                strokeColor: AppColors.lightBlack,
              ),
            ),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(
                  text: ConstString.sub0to4p,
                  textSize: 10,
                  textColor: AppColors.gray,
                  maxLines: 4,
                ),
                CustomTextWidget(
                  text: "Offers via Google Play may differ. Terms apply.",
                  textSize: 10,
                  textColor: AppColors.gray,
                  maxLines: 4,
                ),
                CustomTextWidget(
                  text: "Offer ends 31 December 2025.",
                  textSize: 10,
                  textColor: AppColors.gray,
                  maxLines: 4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
