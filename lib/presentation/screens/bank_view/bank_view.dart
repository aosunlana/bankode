import 'package:bankode/cubit/bank_cubit.dart';
import 'package:bankode/data/models/banks.dart';
import 'package:bankode/presentation/screens/bank_view/widget/info_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankInfo extends StatefulWidget {
  final Banks bank;
  const BankInfo({Key? key, required this.bank}) : super(key: key);

  @override
  State<BankInfo> createState() => _BankInfoState();
}

class _BankInfoState extends State<BankInfo> {
  @override
  void initState() {
    super.initState();
    context.read<NigerianBankCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.bank.name,
          style: const TextStyle(color: Color(0xFF000000)),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0XFF000000)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setWidth(24),
              horizontal: ScreenUtil().setHeight(22)),
          child: Column(
            children: [
              BankInfoContainer(
                  infoTitle: 'Dial Bank USSD ${widget.bank.ussd}',
                  infoSubtitle:
                      'For swift transactions, you can tap here to dial\n Bank USSD directly',
                  infoImage: 'assets/images/rocket.png',
                  infoColor: const Color(0XFFD2FFE2),
                  infoTitleColor: const Color(0xFF00A138)),
              SizedBox(
                height: ScreenUtil().setHeight(14),
              ),
              const BankInfoContainer(
                infoTitle: 'Download Bank App',
                infoSubtitle:
                    'For swift transactions, you can tap here to dial\n Bank USSD directly',
                infoImage: 'assets/images/cart.png',
                infoColor: Color(0XFFFFF4D0),
                infoTitleColor: Color(0XFF967509),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(14),
              ),
              BankInfoContainer(
                infoTitle: 'Bank Code ${widget.bank.code}',
                infoSubtitle:
                    'For swift transactions, you can tap here to dial\n Bank USSD directly',
                infoImage: 'assets/images/headphone.png',
                infoColor: const Color(0XFFFFD5CD),
                infoTitleColor: const Color(0XFFB82003),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(14),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
