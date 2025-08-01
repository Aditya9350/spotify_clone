import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled1/constants/color_files/app_colors.dart';
import 'package:untitled1/screens/dashboard_screen.dart';
import 'package:untitled1/screens/user_profile_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  List<Map<String, String>> drawerMenu = [
    {"icon": "assets/media_icons/Add_Icon.svg", "menu_name": "Add account"},
    {"icon": "assets/media_icons/Frame 102.svg", "menu_name": "what's new"},
    {
      "icon": "assets/media_icons/Recently Played Icon.svg",
      "menu_name": "Recents",
    },
    {
      "icon": "assets/media_icons/Setting Icon.svg",
      "menu_name": "Setting and privacy",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlack.withValues(alpha: .7),
      body: Column(
        children: [
         GestureDetector(
           onTap: (){
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen(isProfileScreen: true)));
           },
           child:  Container(
             alignment: Alignment.center,
             padding: EdgeInsets.only(top: 30,left: 15,bottom: 15),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 10.0, right: 5.0),
                   child: CircleAvatar(
                     radius: 25,
                     backgroundColor: AppColors.brown,
                     child: Text(
                       "A",
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 30,
                         color: AppColors.white,
                       ),
                     ),
                   ),
                 ),
                 SizedBox(width: 5),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       "Aditya Singh",
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 20,
                         color: AppColors.white,
                       ),
                     ),
                     Text(
                       "view profile",
                       style: TextStyle(
                         fontWeight: FontWeight.w400,
                         fontSize: 15,
                         color: AppColors.gray,
                       ),
                     ),
                   ],
                 ),
               ],
             ),
           ),
         ),
          Divider(
            thickness: 1,
            color: AppColors.gray,
            height: 2,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: drawerMenu.length,
              itemBuilder: (context, index) {
                final menuItem = drawerMenu[index];
                return GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 10, top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          menuItem["icon"]!,
                          width: 20,
                          height: 20,
                          color: Colors.white,
                        ),
                        SizedBox(width: 20),
                        Text(
                          menuItem["menu_name"]!,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
