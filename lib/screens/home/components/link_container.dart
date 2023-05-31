import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      height: 55.h,
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
        keyboardType: TextInputType.url,
        style: GoogleFonts.poppins(
          fontSize: 14.sp,
        ),
        decoration: InputDecoration(
          fillColor: kSecondary,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: 'Video URL',
          hintStyle: GoogleFonts.poppins(
            fontSize: 14.sp,
          ),
          suffixIcon: IconButton(
            onPressed: () async {
              Clipboard.getData(Clipboard.kTextPlain).then((value) {
                videolink.text = value!.text!;
                videolink.selection = TextSelection.fromPosition(
                  TextPosition(
                    offset: videolink.text.length,
                  ),
                );
              });
            },
            icon: const Icon(MdiIcons.contentPaste),
            color: kPrimary,
            tooltip: 'Paste',
            enableFeedback: true,
            highlightColor: kPrimary.withOpacity(0.5),
          ),
          suffixIconColor: kPrimary,
        ),
      ),
    );
  }
}
