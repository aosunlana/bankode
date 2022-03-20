import 'package:bankode/ui/shared/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankInfo extends StatefulWidget {
  const BankInfo({Key? key}) : super(key: key);

  @override
  State<BankInfo> createState() => _BankInfoState();
}

class _BankInfoState extends State<BankInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Access Bank",
          style: TextStyle(color: Color(0xFF000000)),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0XFF000000)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setWidth(24),
            horizontal: ScreenUtil().setHeight(22)),
        child: Column(
          children: [
            const BankInfoCustomWidget(
                infoTitle: 'Dial Bank USSD',
                infoSubtitle:
                    'For swift transactions, you can tap here to dial\n Bank USSD directly',
                infoImage: 'assets/images/rocket.avg',
                infoColor: Color(0XFFD2FFE2),
                infoTitleColor: Color(0xFF00A138)),
            SizedBox(
              height: ScreenUtil().setHeight(14),
            ),
            const BankInfoCustomWidget(
              infoTitle: 'Download Bank App',
              infoSubtitle:
                  'For swift transactions, you can tap here to dial\n Bank USSD directly',
              infoImage: 'assets/images/avatar.png',
              infoColor: Color(0XFFFFF4D0),
              infoTitleColor: Color(0XFF967509),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(14),
            ),
            const BankInfoCustomWidget(
              infoTitle: 'Bank Short-Code',
              infoSubtitle:
                  'For swift transactions, you can tap here to dial\n Bank USSD directly',
              infoImage: 'assets/images/headphone.png',
              infoColor: Color(0XFFFFD5CD),
              infoTitleColor: Color(0XFFB82003),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(14),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class BankInfoCustomWidget extends StatelessWidget {
  final String infoTitle;
  final String infoSubtitle;
  final String infoImage;
  final Color infoColor;
  final Color infoTitleColor;
  const BankInfoCustomWidget({
    Key? key,
    required this.infoTitle,
    required this.infoSubtitle,
    required this.infoImage,
    required this.infoColor,
    required this.infoTitleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(335),
      height: ScreenUtil().setHeight(101),
      decoration: BoxDecoration(
          color: infoColor,
          borderRadius: BorderRadius.circular(ScreenUtil().setSp(10))),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(25),
            horizontal: ScreenUtil().setWidth(24)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  infoTitle,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: infoTitleColor),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(8),
                ),
                Text(infoSubtitle,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w300)),
              ],
            ),
            Container(
              height: ScreenUtil().setWidth(54),
              width: ScreenUtil().setWidth(54),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.12),
              ),
              child: ClipOval(
                child: Image.asset(
                  infoImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
