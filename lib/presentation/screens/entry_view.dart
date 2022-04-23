import 'package:bankode/presentation/components/utils/constants.dart';
import 'package:bankode/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EntryView extends StatefulWidget {
  const EntryView({Key? key}) : super(key: key);

  @override
  State<EntryView> createState() => _EntryViewState();
}

class _EntryViewState extends State<EntryView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 68.h,
                ),
                Text(
                  "Let's Get Started,",
                  style: GoogleFonts.rubik(
                      fontSize: 28.sp,
                      color: Color(0XFF2F2F2F),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 2.h),
                Text(
                  "Kindly enter your display name and experience magik ",
                  style: GoogleFonts.rubik(
                      fontSize: 13.sp,
                      color: Color(0XFF2F2F2F),
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 38.h,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Display Name',
                    hintStyle: const TextStyle(
                      color: kEntryLightColor,
                      fontWeight: FontWeight.w100,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: const BorderSide(
                        color: Color(0XFF2F2F2F),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(color: Color(0XFF2F2F2F))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(color: Color(0XFF2F2F2F))),
                  ),
                  controller: controller,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    gradient: LinearGradient(colors: [
                      Color(0XFFF24B55),
                      Color(0XFFF7782F),
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  ),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                        elevation: 0),
                    onPressed: () => Navigator.of(context).pushNamed(
                        RouteGenerator.homeView,
                        arguments: controller.text),
                    child: Text(
                      'Continue',
                      style: GoogleFonts.rubik(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
