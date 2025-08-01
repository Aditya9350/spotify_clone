import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:untitled1/Entity/collection_events.dart';
import 'package:untitled1/constants/color_files/app_colors.dart';

import '../common_widgets/util/util.dart';

class SearchScreen extends StatefulWidget {
  final ZoomDrawerController controller;

  const SearchScreen({super.key, required this.controller});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Map<String, List<CollectionEvents>> searchData = {};


  @override
  void initState() {
    print("run initstate method");
    loadJsonData();
    super.initState();
  }

  Future<void> loadJsonData() async {
    final String jsonString = await rootBundle.loadString('assets/spotify_data/search.json');
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    searchData = jsonMap.map((key, value) {
      final List<dynamic> rawList = value as List;
      final List<CollectionEvents> events = rawList
          .map((item) => CollectionEvents.fromJson(item as Map<String, dynamic>))
          .toList();
      return MapEntry(key, events);
    });
    setState(() {});
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 12.0,right: 12,top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  widget.controller.toggle!();
                },
                child: Utility.getCircleAvatar("A",AppColors.white),
              ),
              SizedBox(width: 10),
              Text(
                "Search",
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
                  'assets/media_icons/camera_logo.svg',
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.darkBlack,
      body: searchData.isNotEmpty? SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0,right: 12,bottom: 70),
          child: ListView.builder(itemBuilder: (context, index){
            List<String> headerLists = searchData.keys.toList();
            final headerKey =  headerLists[index].replaceAll("_", " ");
            bool isStartBrowsing = headerKey=="Start browsing";
            List<CollectionEvents> listEvents = searchData[headerLists[index]]!.toList();
             return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                  headerKey,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listEvents.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio:  isStartBrowsing ? 2.6 : 2.2 ,
                  ),
                  itemBuilder: (context, gridIndex) {
                    final events = listEvents[gridIndex];
                    return Card(
                      surfaceTintColor: Colors.transparent,
                      color: getColorFromHex(events.color!),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SizedBox(
                                width: 100, // 🔹 Set your desired width here
                                child: Text(
                                  events.event_type ?? "No Title",
                                  maxLines: 3,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Transform.translate(offset: getOffSet(isStartBrowsing),
                                child: Transform.rotate(
                                  angle:  isStartBrowsing ? 0.285398 : 0.38, // 45 degrees in radians
                                  child: Image.network(
                                    events.image!,
                                    height: 55,
                                    width: 55,
                                    fit: BoxFit.cover,
                                  ),
                                ),)
                            ),
                          ],
                        ),
                      ),
                    );

                  },
                ),
              ],
            );
          }, shrinkWrap: true,
            itemCount: searchData.length,),
        ),
      ): CircularProgressIndicator()
    );
  }


  Color getColorFromHex(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 6) buffer.write('FF'); // add full opacity if missing
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }


  Offset getOffSet(bool isStartBrowsing){
    return  isStartBrowsing ? Offset(5, 5) : Offset(17, 2);
  }

}
