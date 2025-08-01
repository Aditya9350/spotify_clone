import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:untitled1/common_widgets/util/util.dart';
import 'package:untitled1/constants/color_files/app_colors.dart';

class YourPlaylistScreen extends StatefulWidget {
  final ZoomDrawerController controller;

  const YourPlaylistScreen({super.key, required this.controller});

  @override
  State<YourPlaylistScreen> createState() => _YourPlaylistScreenState();
}

class _YourPlaylistScreenState extends State<YourPlaylistScreen> {
  bool isPlaylistSelect = false;
  bool isArtistSelect = false;
  bool isByYouSelected = false;
  bool isShowGridView = false;


  final List<Map<String, String>> allArtistsList = [
    {"name": "Arya Starr", "image": "assets/artists_icons/Ayra.png"},
    {"name": "Asake", "image": "assets/artists_icons/Asake.png"},
    {"name": "Bloody Civilian", "image": "assets/artists_icons/Bloody.png"},
    {"name": "Bnxn", "image": "assets/artists_icons/Bnxn.png"},
    {"name": "Burna Boy", "image": "assets/artists_icons/Burna.png"},
    {"name": "Fireboy DML", "image": "assets/artists_icons/Fireboy.png"},
    {"name": "Grammyy 4L", "image": "assets/artists_icons/Grammyy.png"},
    {"name": "Kizz Daniel", "image": "assets/artists_icons/Kizz_daniel.png"},
    {"name": "Lyncayo", "image": "assets/artists_icons/Lyncayo.png"},
    {"name": "Odumodu Blvck", "image": "assets/artists_icons/Odumod_blvck.png"},
    {"name": "Omah Lay", "image": "assets/artists_icons/Omah.png"},
    {"name": "Rema", "image": "assets/artists_icons/Rema.png"},
    {"name": "Wizkid", "image": "assets/artists_icons/Wizkid.png"},
    {"name": "Young John", "image": "assets/artists_icons/Young.png"},
    {"name": "Zinoleesky", "image": "assets/artists_icons/Zinoleesky.png"},
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlack,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 55.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.darkBlack,
              expandedHeight: 90,
              collapsedHeight: 80,
              pinned: true,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            widget.controller.toggle!();
                          },
                          child: Utility.getCircleAvatar("A", Colors.white),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Your Library",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/media_icons/Search_Solid.svg',
                            width: 20,
                            height: 20,
                            alignment: Alignment.center,
                            colorFilter: ColorFilter.mode(
                              AppColors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/media_icons/add.svg',
                            width: 25,
                            height: 25,
                            alignment: Alignment.center,
                            colorFilter: ColorFilter.mode(
                              AppColors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isPlaylistSelect || isArtistSelect)
                          GestureDetector(
                            onTap: () {
                              isPlaylistSelect = false;
                              isArtistSelect = false;
                              setState(() {});
                            },
                            child: CircleAvatar(
                              radius: 11,
                              backgroundColor: AppColors.lightBlack,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SvgPicture.asset(
                                  'assets/media_icons/cross_icon.svg',
                                  width: 20,
                                  height: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          if (!isArtistSelect)
                            Row(
                              children: [
                                SizedBox(width: 5),
                                Container(
                                  decoration: (isByYouSelected && isPlaylistSelect)
                                      ? BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color:
                                              (isByYouSelected && isPlaylistSelect)
                                              ? AppColors.green
                                              : AppColors.transparent,
                                        )
                                      : null,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          isPlaylistSelect = !isPlaylistSelect;
                                          setState(() {});
                                        },
                                        child: Utility.getCircleOrCornerContainer(
                                          "Playlist",
                                          isPlaylistSelect
                                              ? AppColors.black
                                              : AppColors.white,
                                          isPlaylistSelect
                                              ? AppColors.green
                                              : AppColors.lightBlack,
                                          false,
                                          12,
                                          isByYouSelected,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      if (isPlaylistSelect)
                                        GestureDetector(
                                          onTap: () {
                                            isByYouSelected = !isByYouSelected;
                                            setState(() {});
                                          },
                                          child: Utility.getCircleOrCornerContainer(
                                            "By You",
                                            isByYouSelected
                                                ? AppColors.black
                                                : AppColors.white,
                                            isByYouSelected
                                                ? AppColors.green
                                                : AppColors.lightBlack,
                                            false,
                                            12,
                                            false,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          SizedBox(width: 5),
                          if (!isPlaylistSelect)
                            GestureDetector(
                              onTap: () {
                                isArtistSelect = !isArtistSelect;
                                setState(() {});
                              },
                              child: Utility.getCircleOrCornerContainer(
                                "Artist",
                                isArtistSelect ? AppColors.black : AppColors.white,
                                isArtistSelect
                                    ? AppColors.green
                                    : AppColors.lightBlack,
                                false,
                                10,
                                false,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Stack(
                              fit: StackFit.loose,
                              children: [
                                SvgPicture.asset(
                                  'assets/media_icons/arrow_down.svg',
                                  width: 10,
                                  height: 10,
                                ),
                                Positioned(
                                  left: 3.0,
                                  child: SvgPicture.asset(
                                    'assets/media_icons/arrow_upward.svg',
                                    width: 10,
                                    height: 10,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              "Recent",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/media_icons/grid_view.svg',
                            width: 12,
                            height: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SliverToBoxAdapter(
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     height: 70,
              //     decoration: BoxDecoration(),
              //      child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Image.network("https://misc.scdn.co/liked-songs/liked-songs-64.png",width: 70,height: 70,),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           Text("Linked Song",style: TextStyle(color: AppColors.white,fontSize: 15,),)
              //         ],
              //       )
              //     ],
              //   ),
              //
              //   ),
              // ),
              SliverList.builder(itemBuilder: (context,index){
                final artist = allArtistsList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    width: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(artist["image"]!,width: 70,height: 70,),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(artist["name"]!,style: TextStyle(color: AppColors.white,fontSize: 17,fontWeight: FontWeight.w400),),
                            Text("Artist",style: TextStyle(color: AppColors.gray,fontSize: 15,),)
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },itemCount: allArtistsList.length,),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    width: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       CircleAvatar(
                         backgroundColor: AppColors.lightGray,
                         radius: 35,
                         child: SvgPicture.asset('assets/media_icons/add.svg',width: 35,height: 35,color: AppColors.white,alignment: Alignment.center,),
                       ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Add Artist",style: TextStyle(color: AppColors.white,fontSize: 17,fontWeight: FontWeight.w400),),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    width: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       Container(
                         width: 70,
                         height: 70,
                         color:  AppColors.lightGray,
                         alignment: Alignment.center,
                         child:  SvgPicture.asset('assets/media_icons/add.svg',width: 35,height: 35,color: AppColors.white,alignment: Alignment.center,),
                       ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Add PodCast",style: TextStyle(color: AppColors.white,fontSize: 17,fontWeight: FontWeight.w400),),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
    );

  }
}
