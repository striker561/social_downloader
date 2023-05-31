import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_downloader/constants.dart';
import 'package:social_downloader/screens/home/components/que_list.dart';

import 'components/grab_video_btn.dart';
import 'components/link_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _downloaderIndex = 0;
  int _qualityIndex = 3;
  int _formatIndex = 2;
  TextEditingController videolink = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(
            FocusNode(),
          );
        },
        child: Scaffold(
          appBar: homeScreenAppbar(),
          body: Padding(
            padding: const EdgeInsets.all(gPadding),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  LinkContainer(videolink: videolink),
                  videoTypeSelector(),
                  if (_downloaderIndex != 2) qualitySelector(),
                  formatSelector(),
                  SizedBox(
                    height: 10.h,
                  ),
                  const GrabVideoBtn(),
                  SizedBox(
                    height: 10.h,
                  ),
                  const QueList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customVideoRadioButton(
    String text,
    String imagePath,
    int index,
    Color radioSelectedColor,
  ) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _downloaderIndex = index;
        });
      },
      style: ButtonStyle(
        enableFeedback: true,
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (index == _downloaderIndex) {
            return radioSelectedColor;
          }
          return kSecondary;
        }),
        side: MaterialStateProperty.resolveWith((states) {
          if (index == _downloaderIndex) {
            return const BorderSide(color: kSecondary);
          }
          return BorderSide(color: radioSelectedColor);
        }),
        overlayColor: MaterialStateProperty.resolveWith((states) {
          return kPrimary.withOpacity(0.5);
        }),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Image.asset(
              imagePath,
              height: 20.h,
            ),
            onPressed: null,
          ),
          Text(
            text,
            style: GoogleFonts.poppins(
              color: kPrimary,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }

  Container videoTypeSelector() {
    return Container(
      margin: const EdgeInsets.only(top: gMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            child: customVideoRadioButton(
              'Youtube',
              'assets/icons/yt.png',
              0,
              const Color(0xFFC4302B),
            ),
          ),
          SizedBox(
            child: customVideoRadioButton(
              'Shorts',
              'assets/icons/shorts.png',
              1,
              const Color(0xFFC4302B),
            ),
          ),
          SizedBox(
            child: customVideoRadioButton(
              'Tiktoks',
              'assets/icons/tok.png',
              2,
              const Color(0xFFFF0051),
            ),
          )
        ],
      ),
    );
  }

  Widget customQualityRadioButton(
    String text,
    int index,
  ) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _qualityIndex = index;
        });
      },
      style: ButtonStyle(
        enableFeedback: true,
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (index == _qualityIndex) {
            return kPrimary.withOpacity(0.5);
          }
          return kSecondary;
        }),
        side: MaterialStateProperty.resolveWith((states) {
          if (index == _qualityIndex) {
            return const BorderSide(color: kSecondary);
          }
          return const BorderSide(color: kPrimary);
        }),
        overlayColor: MaterialStateProperty.resolveWith((states) {
          return kPrimary.withOpacity(0.5);
        }),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: !(index == _qualityIndex) ? kPrimary : kSecondary,
          fontSize: 12.sp,
        ),
      ),
    );
  }

  Container qualitySelector() {
    return Container(
      margin: const EdgeInsets.only(top: gMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Quality',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: kSecondary,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  child: customQualityRadioButton(
                    '144p',
                    0,
                  ),
                ),
                SizedBox(
                  child: customQualityRadioButton(
                    '240p',
                    1,
                  ),
                ),
                SizedBox(
                  child: customQualityRadioButton(
                    '360p',
                    2,
                  ),
                ),
                SizedBox(
                  child: customQualityRadioButton(
                    '480p',
                    3,
                  ),
                ),
                SizedBox(
                  child: customQualityRadioButton(
                    '720p',
                    4,
                  ),
                ),
                SizedBox(
                  child: customQualityRadioButton(
                    '1080p',
                    5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customFormatRadioButton(
    String text,
    int index,
  ) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _formatIndex = index;
        });
      },
      style: ButtonStyle(
        enableFeedback: true,
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (index == _formatIndex) {
            return kPrimary.withOpacity(0.5);
          }
          return kSecondary;
        }),
        side: MaterialStateProperty.resolveWith((states) {
          if (index == _formatIndex) {
            return const BorderSide(color: kSecondary);
          }
          return const BorderSide(color: kPrimary);
        }),
        overlayColor: MaterialStateProperty.resolveWith((states) {
          return kPrimary.withOpacity(0.5);
        }),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: !(index == _formatIndex) ? kPrimary : kSecondary,
          fontSize: 12.sp,
        ),
      ),
    );
  }

  Container formatSelector() {
    return Container(
      margin: const EdgeInsets.only(top: gMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Format',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: kSecondary,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  child: customFormatRadioButton(
                    'MP3',
                    0,
                  ),
                ),
                SizedBox(
                  child: customFormatRadioButton(
                    '3GP',
                    1,
                  ),
                ),
                SizedBox(
                  child: customFormatRadioButton(
                    'MP4',
                    2,
                  ),
                ),
                SizedBox(
                  child: customFormatRadioButton(
                    'AVI',
                    3,
                  ),
                ),
                SizedBox(
                  child: customFormatRadioButton(
                    'MKV',
                    4,
                  ),
                ),
                SizedBox(
                  child: customFormatRadioButton(
                    'MOV',
                    5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

AppBar homeScreenAppbar() {
  return AppBar(
    title: Text(
      'Grabber',
      style: GoogleFonts.getFont('Poppins'),
    ),
  );
}
