import 'package:bankode/cubit/bank_cubit.dart';
import 'package:bankode/data/models/banks.dart';
import 'package:bankode/data/services/utility_services/calls_service.dart';
import 'package:bankode/enums/enums.dart';
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
        backgroundColor: Colors.white,
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
                  onTap: () =>
                      CallService.call(Uri.encodeComponent(widget.bank.ussd)),
                  infoTitle: 'Dial Bank USSD ${widget.bank.ussd}',
                  infoSubtitle:
                      'For swift transactions, you can tap here to dial\n Bank USSD directly',
                  infoImage: 'assets/images/dial-logo.png',
                  infoColor: const Color(0XFFD2FFE2),
                  infoTitleColor: const Color(0xFF00A138)),
              SizedBox(
                height: ScreenUtil().setHeight(14),
              ),
              BankInfoContainer(
                onTap: () {
                  triggerStore(widget.bank.name.toLowerCase(), context);
                },
                infoTitle: 'Download Bank App',
                infoSubtitle:
                    'For swift transactions, you can tap here to dial\n Bank USSD directly',
                infoImage: 'assets/images/cart.png',
                infoColor: const Color(0XFFFFF4D0),
                infoTitleColor: const Color(0XFF967509),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(14),
              ),
              BankInfoContainer(
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text(
                        'Unavailable',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 13),
                      ),
                      content: const Text(
                        'Selected functionality is not yet available',
                        style: TextStyle(fontSize: 14),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text(
                            'OK',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  );
                },
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

void triggerStore(String name, BuildContext context) {
  switch (name) {
    case "access bank":
      NigerianBankCubit.launchStore(Bank.AccessBank);
      break;
    case "access bank (diamond)":
      NigerianBankCubit.launchStore(Bank.AccessDiamond);
      break;
    case "alat by wema":
      NigerianBankCubit.launchStore(Bank.AlatByWema);
      break;
    case "cemcs microfinance bank":
      NigerianBankCubit.launchStore(Bank.CEMCSBank);
      break;
    case "citibank nigeria":
      NigerianBankCubit.launchStore(Bank.CitiBank);
      break;
    case "ecobank nigeria":
      NigerianBankCubit.launchStore(Bank.EcoBank);
      break;
    case "ekondo microfinance bank":
      NigerianBankCubit.launchStore(Bank.EkondoBank);
      break;
    case "fidelity bank":
      NigerianBankCubit.launchStore(Bank.FidelityBank);
      break;
    case "first bank of nigeria":
      NigerianBankCubit.launchStore(Bank.FirstBank);
      break;
    case "first city monument bank":
      NigerianBankCubit.launchStore(Bank.FCMB);
      break;
    case "globus bank":
      NigerianBankCubit.launchStore(Bank.GlobusBank);
      break;
    case "guaranty trust bank":
      NigerianBankCubit.launchStore(Bank.Gtbank);
      break;
    case "hasal microfinance bank":
      NigerianBankCubit.launchStore(Bank.HasalBank);
      break;
    case "heritage bank":
      NigerianBankCubit.launchStore(Bank.HeritageBank);
      break;
    case "jaiz bank":
      NigerianBankCubit.launchStore(Bank.JaizBank);
      break;
    case "keystone bank":
      NigerianBankCubit.launchStore(Bank.KeystoneBank);
      break;
    case "kuda bank":
      NigerianBankCubit.launchStore(Bank.KudaBank);
      break;
    case "one finance":
      NigerianBankCubit.launchStore(Bank.OneFinance);
      break;
    case "paga":
      NigerianBankCubit.launchStore(Bank.Paga);
      break;
    case "parallex bank":
      NigerianBankCubit.launchStore(Bank.ParallexBank);
      break;
    case "paycom":
      NigerianBankCubit.launchStore(Bank.Paycom);
      break;
    case "polaris bank":
      NigerianBankCubit.launchStore(Bank.PolarisBank);
      break;
    case "providus bank":
      NigerianBankCubit.launchStore(Bank.ProvidusBank);
      break;
    case "sparkle microfinance bank":
      NigerianBankCubit.launchStore(Bank.SparkleBank);
      break;
    case "stanbic ibtc bank":
      NigerianBankCubit.launchStore(Bank.StambicIBTC);
      break;
    case "standard chartered bank":
      NigerianBankCubit.launchStore(Bank.StandardCharteredBank);
      break;
    case "sterling bank":
      NigerianBankCubit.launchStore(Bank.SterlingBank);
      break;
    case "suntrust bank":
      NigerianBankCubit.launchStore(Bank.SunTrustBank);
      break;
    case "taj bank":
      NigerianBankCubit.launchStore(Bank.TAJBank);
      break;
    case "tcf mfb":
      NigerianBankCubit.launchStore(Bank.TCFMFB);
      break;
    case "titan trust bank":
      NigerianBankCubit.launchStore(Bank.TitanTrustBank);
      break;
    case "union bank of nigeria":
      NigerianBankCubit.launchStore(Bank.UnionBank);
      break;
    case "united bank of africa":
      NigerianBankCubit.launchStore(Bank.UBA);
      break;
    case "unity bank":
      NigerianBankCubit.launchStore(Bank.UnityBank);
      break;
    case "vfd":
      NigerianBankCubit.launchStore(Bank.VFD);
      break;
    case "wema bank":
      NigerianBankCubit.launchStore(Bank.WemaBank);
      break;
    case "zenith bank":
      NigerianBankCubit.launchStore(Bank.ZenithBank);
      break;
    default:
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(
            'Unavailable',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
          ),
          content: const Text(
            'App is not available',
            style: TextStyle(fontSize: 14),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text(
                'OK',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ),
          ],
        ),
      );
  }
}
