import 'package:flutter/material.dart';
import 'package:untitled1/common_widgets/custom_text_widget.dart';
import 'package:untitled1/common_widgets/my_custom_Btn_round.dart';
import 'package:untitled1/constants/color_files/app_colors.dart';
import 'package:untitled1/helper_class/sliver_persistent_header.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  ScrollController controller = ScrollController();
  double headerOpacity = 0;
  bool isScroll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: isScroll
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.darkBlack,
                      AppColors.darkBlack,
                    ],
                    stops: [0.4, 0.9],
                  )
                : LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.brown.withValues(alpha: 0.9),
                      AppColors.darkBlack,
                      AppColors.darkBlack,
                    ],
                    stops: [0.1, 0.5, 0.9],
                  ),
          ),
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              setState(() {
                headerOpacity = controller.hasClients && controller.offset > 60
                    ? 1.0
                    : 0.0;
                isScroll = headerOpacity == 1 ? true : false;
              });
              return true;
            },
            child:CustomScrollView(
              controller: controller,
              slivers: [
                SliverAppBar(
                  pinned: true,
                  floating: false,
                  snap: false,
                  expandedHeight: 300,
                  backgroundColor: isScroll
                      ? AppColors.brown.withValues(alpha: 0.9, blue: 0.2)
                      : AppColors.transparent,
                  leading: const Icon(Icons.arrow_back, size: 30, color: Colors.white),
                  title: AnimatedOpacity(
                    opacity: headerOpacity,
                    duration: const Duration(milliseconds: 300),
                    child: const Text(
                      "Aditya Singh",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.only(top: 90, left: 10, right: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: AppColors.brown,
                                radius: 65,
                                child: Text(
                                  "A",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 65,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Aditya Singh",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Row(
                                      children: [
                                        CustomTextWidget(
                                          text: "0",
                                          textSize: 15,
                                          textColor: AppColors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        const SizedBox(width: 3),
                                        CustomTextWidget(
                                          text: "followers",
                                          textSize: 11,
                                          textColor: AppColors.lightWhite,
                                        ),
                                        const SizedBox(width: 5),
                                        const Icon(Icons.circle, size: 5, color: AppColors.white),
                                        const SizedBox(width: 2),
                                        CustomTextWidget(
                                          text: "17",
                                          textSize: 15,
                                          textColor: AppColors.lightWhite,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        const SizedBox(width: 3),
                                        CustomTextWidget(
                                          text: "following",
                                          textSize: 11,
                                          textColor: AppColors.lightWhite,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              MyCustomBtnRound(
                                onTap: () {},
                                text: "Edit",
                                borderStroke: true,
                                width: 60,
                                height: 35,
                                textColor: AppColors.white,
                                strokeColor: AppColors.lightWhite,
                                bgColor: AppColors.transparent,
                                textSize: 15,
                              ),
                              const SizedBox(width: 15),
                              const Icon(Icons.more_vert_rounded, size: 35, color: AppColors.white),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Sticky Playlist header
                SliverPersistentHeader(
                  pinned: true,
                  delegate: MySliverPersistentHeaderDelegate(
                    child: Container(
                      color: isScroll ? AppColors.darkBlack : AppColors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      alignment: Alignment.centerLeft,
                      child: CustomTextWidget(
                        text: "Playlist",
                        textSize: 25,
                        textColor: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    minHeight:  60, maxHeight: 60
                  ),
                ),

                // List content (up to 20)
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return Container(
                        height: 60,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "index $index",
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                    childCount: 20,
                  ),
                ),
              ],
          ),
        ),
    ));
  }
}
