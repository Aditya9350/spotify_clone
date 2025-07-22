import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/common_widgets/cutomArtistsScreen.dart';

class SelectArtistScreen extends StatefulWidget {
  const SelectArtistScreen({super.key});

  @override
  State<SelectArtistScreen> createState() => _SelectArtistScreenState();
}

class _SelectArtistScreenState extends State<SelectArtistScreen> {
  Set<String> selectedArtists = {};
  // List<Map<String, String>> hindiArtists = artistData["hindi"]!;

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

  Future<Map<String, dynamic>> loadArtistJson() async {
    String jsonString = await rootBundle.loadString('assets/artist.json');
    return jsonDecode(jsonString);
  }


  final List<Map<String, String>> initialArtistsList = [];
  final int initialArtistCount = 14;

  bool isShowAllList = false;

  final double expandedHeight = 220;
  final double colapseHeight = 140;

  @override
  void initState() {
    super.initState();
    initialArtistsList.addAll(allArtistsList.take(initialArtistCount));
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> displayList = isShowAllList
        ? allArtistsList
        : [
      ...initialArtistsList,
      {"name": "More", "image": "assets/artists_icons/More.png"},
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  pinned: true,
                  expandedHeight: expandedHeight,
                  collapsedHeight: colapseHeight,
                  flexibleSpace: LayoutBuilder(
                    builder: (context, constraints) =>
                        headerLayout(constraints.maxHeight >= expandedHeight),
                  ),
                ),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final artist = displayList[index];

                    if (artist["name"] == "More") {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            isShowAllList = true;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: CustomArtistImage(
                            imagePath: artist["image"]!,
                            artisName: "More for you",
                          ),
                        ),
                      );
                    }

                    final isSelected = selectedArtists.contains(artist["name"]);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected
                              ? selectedArtists.remove(artist["name"])
                              : selectedArtists.add(artist["name"]!);
                        });
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: CustomArtistImage(
                              imagePath: artist["image"]!,
                              artisName: artist["name"]!,
                            ),
                          ),
                          if (isSelected)
                            Positioned(
                              top: 15,
                              right: 15,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  }, childCount: displayList.length),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                  ),
                ),
              ],
            ),
            Container(
              height: 200,
              color: Colors.black.withOpacity(.3),
            ),
            if (selectedArtists.isNotEmpty)
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Selected: ${selectedArtists.length}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (selectedArtists.length >= 3) SizedBox(height: 10),
                    if (selectedArtists.length >= 3)
                      ElevatedButton(
                        onPressed: () {
                          // Your logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                        ),
                        child: Text(
                          "Done",
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget headerLayout(bool changeSize) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        alignment: Alignment.bottomLeft,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Choose 3 or more artists you like.",
                maxLines: 2,
                style: TextStyle(
                  color: Colors.black,
                  height: 1.1,
                  fontSize: changeSize ? 30 : 15,
                  fontWeight: changeSize ? FontWeight.bold : FontWeight.w300,
                ),
                textAlign: changeSize ? TextAlign.start : TextAlign.center,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: changeSize ? 50 : 40,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Colors.white54),
                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                    filled: true,
                    fillColor: Colors.grey[900],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 5),
              Wrap(
                spacing: 5,
                children: [
                  _buildChip("For You", true),
                  _buildChip("Hindi", false),
                  _buildChip("Punjabi", false),
                  _buildChip("International", false),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String label, bool selected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,

    );
  }
}
