import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankInfoContainer extends StatelessWidget {
  final String infoTitle;
  final String infoSubtitle;
  final String infoImage;
  final Color infoColor;
  final Color infoTitleColor;
  final void Function() onTap;
  const BankInfoContainer({
    Key? key,
    required this.infoTitle,
    required this.infoSubtitle,
    required this.infoImage,
    required this.infoColor,
    required this.infoTitleColor,
    required this.onTap,
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
        child: InkWell(
          onTap: onTap,
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
      ),
    );
  }
}
