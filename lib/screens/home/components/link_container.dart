import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:social_downloader/constants.dart';

class LinkContainer extends StatelessWidget {
  const LinkContainer({
    super.key,
    required this.videolink,
  });

  final TextEditingController videolink;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      margin: EdgeInsets.only(
        top: gMargin.h,
      ),
      decoration: BoxDecoration(
        color: kSecondary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: videolink,
        cursorColor: kPrimary,
        style: GoogleFonts.poppins(),
        decoration: const InputDecoration(
          fillColor: kSecondary,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            MdiIcons.linkVariant,
          ),
          prefixIconColor: kPrimary,
        ),
      ),
    );
  }
}
