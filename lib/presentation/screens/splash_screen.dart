import 'package:bankode/presentation/screens/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'entry_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> doIt() async {
    final prefs = await SharedPreferences.getInstance();
    final showHome = prefs.getBool('showHome') ?? false;
    final showName = prefs.getString('controller');
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return showHome
                    ? HomeView(
                        nickName: showName!,
                      )
                    : const EntryView();
              }),
            ));
  }

  @override
  void initState() {
    super.initState();
    doIt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 333.h),
          Center(
              child: SizedBox(
                  height: 100.h,
                  width: 90.w,
                  child: const Image(
                      image: AssetImage('assets/images/app-logo.png')))),
          Center(
              child: SizedBox(
                  height: 37.h,
                  width: 163.w,
                  child: const Image(
                      image: AssetImage('assets/images/bankode-text.png')))),
          SizedBox(height: 272.h),
          Center(child: Text('Version 1.0.5'))
        ],
      ),
    );
  }
}
