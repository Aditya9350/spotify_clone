import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:untitled1/Entity/artist_detail.dart';
import 'package:untitled1/common_widgets/common_header_dasboard.dart';
import 'package:untitled1/common_widgets/util/util.dart';
import 'package:untitled1/constants/color_files/app_colors.dart';

class HomeScreen extends StatefulWidget {
  final ZoomDrawerController controller;
  const HomeScreen({super.key, required this.controller, });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, List<ArtistDetails>> artistData = {};

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

  bool isPodCastSelect = false;
  final double expandedHeight = 100;
  final double colapseHeight = 60;

  @override
  void initState() {
    loadHomeData();
    super.initState();
  }

  Future<void> loadHomeData() async {
    String jsonString = await rootBundle.loadString(
      'assets/spotify_data/artist.json',
    );
    final Map<String, dynamic> jsonStringMap = jsonDecode(jsonString);

    artistData = jsonStringMap.map((key, value) {
      final List<dynamic> eventType = value as List;
      final List<ArtistDetails> artistTypeList = eventType
          .map((item) => ArtistDetails.formJson(item as Map<String, dynamic>))
          .toList();

      return MapEntry(key, artistTypeList);
    });
    setState(() {
      print("Size of artist ${artistData.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlack,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.darkBlack,
              expandedHeight: 70,
              collapsedHeight: 56,
              pinned: true,
              floating: true,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) => Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 25,
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          widget.controller.toggle!();
                        },
                        child: Utility.getCircleAvatar("A", AppColors.white),
                      ),
                      SizedBox(width: 7),
                      CommonHeaderDashboard(
                        onTap: () {},
                        textHeader: "All",
                        isSelected: false,
                        bgColor: AppColors.green,
                        textColor: AppColors.black,
                      ),
                      SizedBox(width: 7),
                      CommonHeaderDashboard(
                        onTap: () {},
                        textHeader: "Music",
                        isSelected: false,
                        bgColor: AppColors.black,
                      ),
                      SizedBox(width: 7),
                      CommonHeaderDashboard(
                        onTap: () {},
                        textHeader: "Podcasts",
                        isSelected: false,
                        bgColor: AppColors.lightBlack,
                      ),

                      // if(isPodCastSelect)
                      //   CommonHeaderDasboard(onTap: (){}, textHeader: "Following", isSelected: false),
                    ],
                  ),
                ),
              ),
            ),
            artistData.isEmpty
                ? SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      List<String> artistHeader = artistData.keys.toList();
                      List<ArtistDetails> allArtist =
                          artistData[artistHeader[index]]!;

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                              ),
                              child: Text(
                                artistHeader[index],
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 190,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: allArtist.length,
                                itemBuilder:
                                    (BuildContext context, int artistIndex) {
                                      final artist = allArtist[artistIndex];
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 150,
                                              height: 150,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              clipBehavior: Clip.hardEdge,
                                              child: artist.isNetwork!
                                                  ? Image.network(
                                                      artist.image!,
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Image.asset(
                                                      artist.image!,
                                                      fit: BoxFit.cover,
                                                    ),
                                            ),
                                            SizedBox(height: 6),
                                            Text(
                                              artist.name ?? '',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                              ),
                            ),
                          ],
                        ),
                      );
                    }, childCount: artistData.length),
                  ),
          ],
        ),
      ),
    );
  }
}
