import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_downloader/constants.dart';

import 'components/grab_video_btn.dart';
import 'components/link_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _downloaderIndex = 0;
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
            child: Column(
              children: [
                LinkContainer(videolink: videolink),
                videoTypeSelector(),
                SizedBox(
                  height: 10.h,
                ),
                const GrabVideoBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customRadioButton(
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
            child: customRadioButton(
              'Youtube',
              'assets/icons/yt.png',
              0,
              const Color(0xFFC4302B),
            ),
          ),
          SizedBox(
            child: customRadioButton(
              'Shorts',
              'assets/icons/shorts.png',
              1,
              const Color(0xFFC4302B),
            ),
          ),
          SizedBox(
            child: customRadioButton(
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
}

AppBar homeScreenAppbar() {
  return AppBar(
    title: Text(
      'Grabber',
      style: GoogleFonts.getFont('Poppins'),
    ),
  );
}
