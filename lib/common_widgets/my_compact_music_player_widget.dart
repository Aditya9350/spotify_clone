import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:untitled1/constants/color_files/app_colors.dart';

class MyCompactMusicPlayerWidget extends StatefulWidget {
  String imagePath;
  String songTittle;
  String albumTittle;
  bool isPlay;
  bool myPlayList;
  double height;

  // Color bgColor;
  String deviceConnectImagePath;

  MyCompactMusicPlayerWidget({
    super.key,
    required this.imagePath,
    required this.songTittle,
    required this.albumTittle,
    required this.isPlay,
    required this.myPlayList,
    this.height = 65,
    // required this.bgColor,
    this.deviceConnectImagePath = "assets/media_icons/select_device.svg",
  });

  @override
  State<MyCompactMusicPlayerWidget> createState() =>
      _MyCompactMusicPlayerWidgetState();
}

class _MyCompactMusicPlayerWidgetState
    extends State<MyCompactMusicPlayerWidget> {
  PaletteGenerator? _paletteGenerator;

  @override
  void initState() {
    super.initState();
    getDominantColor(widget.imagePath);
  }

  Future<void> getDominantColor(String imagePath) async {
    _paletteGenerator = await PaletteGenerator.fromImageProvider(
      AssetImage(imagePath),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: _paletteGenerator!=null ? _paletteGenerator!.dominantColor!.color.withOpacity(0.3) : AppColors.white
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 7, right: 7, top: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(image: AssetImage(widget.imagePath)),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.songTittle,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              widget.albumTittle,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          width: 140,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  widget.deviceConnectImagePath,
                                  width: 30,
                                  height: 30,
                                  alignment: Alignment.center,
                                  theme: SvgTheme(
                                    currentColor: AppColors.white,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: CircleAvatar(
                                  maxRadius: 15,
                                  backgroundColor: widget.myPlayList
                                      ? AppColors.green
                                      : AppColors.white,
                                  child: isUserPlayList(widget.myPlayList),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: playAndPauseIcon(widget.isPlay),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            LinearProgressIndicator(
              backgroundColor: Colors.white.withOpacity(.2),
              borderRadius: BorderRadius.circular(10),
              value: .5,
            ),
          ],
        ),
      ),
    );
  }

  Widget isUserPlayList(bool myPlaylist) {
    return SvgPicture.asset(
      widget.myPlayList
          ? 'assets/media_icons/check.svg'
          : 'assets/media_icons/Add_Icon.svg',
      alignment: Alignment.center,
      theme: SvgTheme(
        currentColor: myPlaylist ? AppColors.black : AppColors.white,
      ),
      colorFilter: ColorFilter.mode(
        myPlaylist ? AppColors.black : AppColors.white,
        BlendMode.srcIn,
      ),
    );
  }

  Widget playAndPauseIcon(bool isPlay) {
    return Image.asset(
      isPlay
          ? 'assets/media_icons/Pause Icon.png'
          : 'assets/media_icons/play.png',
      width: 30,
      height: 30,
      alignment: Alignment.center,
      color: AppColors.white,
    );
  }
}
