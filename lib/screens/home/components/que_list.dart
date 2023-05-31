import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:social_downloader/constants.dart';

class QueList extends StatelessWidget {
  const QueList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: gPadding,
            right: gPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Download Queue',
                    style: GoogleFonts.poppins(
                      color: kSecondary,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Downloads are in gallery',
                    style: GoogleFonts.poppins(
                      color: kSecondary,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              const IconButton(
                onPressed: null,
                icon: Icon(
                  MdiIcons.progressDownload,
                  color: kSecondary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
            itemCount: 2,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const Icon(
                  MdiIcons.downloadBox,
                  color: kSecondary,
                ),
                trailing: Text(
                  "Pendng",
                  style: GoogleFonts.poppins(
                    color: kSecondary.withOpacity(0.5),
                    fontSize: 10.sp,
                  ),
                ),
                title: Text(
                  "Tk - Why Would you do that {$index}",
                  style: GoogleFonts.poppins(
                    color: kSecondary,
                    fontSize: 14.sp,
                  ),
                ),
              );
            }),
      ],
    );
  }
}
