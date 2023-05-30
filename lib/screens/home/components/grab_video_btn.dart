import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:social_downloader/constants.dart';

class GrabVideoBtn extends StatelessWidget {
  const GrabVideoBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return kSecondary;
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          return kPrimary;
        }),
        elevation: MaterialStateProperty.resolveWith((states) {
          return 8;
        }),
        overlayColor: MaterialStateProperty.resolveWith((states) {
          return kPrimary.withOpacity(0.5);
        }),
      ),
      child: SizedBox(
        width: 200.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              MdiIcons.arrowDownBoldHexagonOutline,
            ),
            Text(
              'GRAB VIDEO',
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
