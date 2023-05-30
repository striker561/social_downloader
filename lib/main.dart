import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_downloader/constants.dart';
import 'package:social_downloader/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 810),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Grabber Downloader',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: kPrimary,
            appBarTheme: AppBarTheme(
              backgroundColor: kPrimary,
              foregroundColor: kSecondary,
              elevation: 0,
              toolbarHeight: 75,
              titleTextStyle: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          home: const SafeArea(
            child: HomeScreen(),
          ),
        );
      },
    );
  }
}
