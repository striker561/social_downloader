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
            left: gPadding / 2,
            right: gPadding / 2,
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
            itemCount: 5,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(bottom: gMargin / 2),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: const Border.fromBorderSide(
                    BorderSide(
                      color: kSecondary,
                      width: 1.0,
                    ),
                  ),
                  color: kSecondary.withOpacity(0.3),
                ),
                child: ListTile(
                  horizontalTitleGap: 0,
                  contentPadding: const EdgeInsets.only(
                    left: gPadding,
                  ),
                  subtitle: Text(
                    'Downloading... $index%',
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontStyle: FontStyle.italic,
                      color: kSecondary.withOpacity(0.7),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: null,
                    icon: const Icon(
                      MdiIcons.close,
                      color: kSecondary,
                    ),
                    iconSize: 20.sp,
                  ),
                  title: Text(
                    "Tk - Why Would you do that {$index}",
                    style: GoogleFonts.poppins(
                      color: kSecondary,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
