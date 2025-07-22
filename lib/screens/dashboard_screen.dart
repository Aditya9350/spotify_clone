import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:marquee/marquee.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:untitled1/common_widgets/my_compact_music_player_widget.dart';
import 'package:untitled1/screens/premium_screen.dart';
import 'package:untitled1/screens/search_screen.dart';
import 'package:untitled1/screens/your_playlist_screen.dart';

import '../constants/color_files/app_colors.dart';
import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ZoomDrawerController controller = ZoomDrawerController();
  PaletteGenerator? _paletteGenerator;
  int _selectedIndex = 2;

  List<Widget> listScreen = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    initilizePaletteGenerator();
    listScreen = [
      HomeScreen(controller: controller),
      SearchScreen(controller: controller),
      YourPlaylistScreen(controller: controller),
      PremiumScreen(controller: controller),
    ];
    super.initState();
  }

  Future<void> initilizePaletteGenerator() async {
    _paletteGenerator = await PaletteGenerator.fromImageProvider(
      AssetImage('assets/artists_icons/Zinoleesky.png'),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      slideWidth: MediaQuery.of(context).size.width * .9,
      style: DrawerStyle.style1,
      controller: controller,
      androidCloseOnBackTap: true,
      mainScreenTapClose: true,
      angle: 0,
      menuScreen: Drawer(),
      mainScreen: Scaffold(
        body: listScreen.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  listScreen[_selectedIndex],
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          useRootNavigator: true,
                          isScrollControlled: true,
                          backgroundColor: _paletteGenerator != null
                              ? _paletteGenerator!.dominantColor!.color
                                    .withOpacity(0.3)
                              : AppColors.white,
                          builder: (context) {
                            return Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height,
                              color: _paletteGenerator!.dominantColor!.color,
                              child: openMusicDetailLayout(),
                            );
                          },
                        );
                      },
                      child: MyCompactMusicPlayerWidget(
                        imagePath: "assets/artists_icons/Zinoleesky.png",
                        songTittle: "user playlist",
                        albumTittle: "Arjit sing",
                        isPlay: true,
                        myPlayList: true,
                      ),
                    ),
                  ),
                ],
              ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.gray,
          selectedLabelStyle: TextStyle(color: AppColors.white),
          unselectedLabelStyle: TextStyle(color: AppColors.gray),
          type: BottomNavigationBarType.fixed,
          // Add this line
          backgroundColor: AppColors.black.withOpacity(.8),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/navbar_icons/home.png',
                height: 20,
                width: 20,
                color: AppColors.gray,
              ),
              label: 'Home',
              activeIcon: Image.asset(
                'assets/navbar_icons/Home_solid.png',
                height: 20,
                width: 20,
                color: AppColors.white,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/navbar_icons/Search.png',
                height: 20,
                width: 20,
                color: AppColors.gray,
              ),
              label: 'search',
              activeIcon: Image.asset(
                'assets/navbar_icons/search_solid.png',
                height: 20,
                width: 20,
                color: AppColors.white,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/navbar_icons/playlist_Icon.png',
                height: 20,
                width: 20,
                color: AppColors.gray,
              ),
              label: 'Your Library',
              activeIcon: Image.asset(
                'assets/navbar_icons/playlist_Icon.png',
                height: 20,
                width: 20,
                color: AppColors.white,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/navbar_icons/spotify_icon.png',
                height: 20,
                width: 20,
                color: AppColors.gray,
              ),
              label: 'Premium',
              activeIcon: Image.asset(
                'assets/navbar_icons/spotify_icon.png',
                height: 20,
                width: 20,
                color: AppColors.white,
              ),
            ),
            // BottomNavigationBarItem(
            //   icon: SvgPicture.asset('assets/navbar_icons/Home Icon A.svg'),
            //   label: 'Create',
            // ),
          ],
        ),
      ),
    );
  }

  Widget openMusicDetailLayout() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 50,
                  color: AppColors.white,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "playing",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "playing",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.more_vert, size: 40, color: AppColors.white),
              ),
            ],
          ),
          SizedBox(height: 35),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              height: 350,
              color: Colors.red,
            ),
          ),

          SizedBox(height: 30),
           SizedBox(
             width: double.infinity,
             height: 60,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 SvgPicture.asset('assets/spotify_icons/logo.svg',height: 60, width: 60,),
                 Padding(
                   padding: const EdgeInsets.only(left: 5.0,right: 5),
                   child: Container(
                     height: 60,
                     color: Colors.red,
                     child: Container(
                         padding: const EdgeInsets.only(left: 10.0,right: 10),
                         child: Column(
                           crossAxisAlignment:CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                            Text("Music name ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),),
                             SizedBox(height: 5,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                               Container(
                                 width: 15,
                                 height: 15,
                                 color: AppColors.green,
                                 child:  Icon(Icons.star,size: 15,),
                               ),
                                 SizedBox(width: 5,),
                                 Text("Artists name ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),),
                               ],
                             )
                           ],
                         ),
                       ),
                     ),
                 ),
                 Spacer(),
                 SvgPicture.asset('assets/media_icons/cross_icon.svg',width: 30,height: 30,),
                 SizedBox(width: 25,),
                 SvgPicture.asset('assets/media_icons/cross_icon.svg',width: 30,height: 30,)
               ],
             ),
           ),
          SizedBox(height: 20,),
          LinearProgressIndicator(
            color: AppColors.gray,
            backgroundColor: Colors.white,
            value: 0.5,

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("0.00",style: TextStyle(color: AppColors.white,fontSize: 15,fontWeight: FontWeight.w400),),
              Text("4.00",style: TextStyle(color: AppColors.white,fontSize: 15,fontWeight: FontWeight.w400),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset('assets/media_icons/previous_icon.svg',height: 25,width: 25,alignment: Alignment.center,),

             Icon(Icons.timer_sharp,color: AppColors.white,size: 25,)
            ],
          )
        ],
      ),
    );
  }
}
