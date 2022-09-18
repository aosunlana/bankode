import 'dart:io';

import 'package:bankode/data/models/banks.dart';
import 'package:bankode/data/repositories/base_request.dart';
import 'package:bankode/enums/enums.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'bank_state.dart';

class NigerianBankCubit extends Cubit<NigerianBankState> {
  final HTTPRequest httpRequest;

  NigerianBankCubit(this.httpRequest) : super(NigerianBankLoadingState());
  List<Banks> results = [];

  //This function is called in the initState function to load the bank List before the widget builds.
  Future<void> loadBankList() async {
    try {
      results = await httpRequest.execute();
      emit(NigerianBankLoadedState(results));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //This function is called whenever the text field changes.
  Future<void> runFilter(String enteredKeyword) async {
    if (enteredKeyword.isEmpty) {
      emit(NigerianBankLoadedState(results));
    } else {
      final filteredResult = results
          .where((bank) =>
              bank.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      emit(NigerianBankLoadedState(filteredResult));
    }
  }

//This static method is called in the initState function and serves as the welcome greeting to the user
  static String userGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  static void launchStore(Bank bank) {
    if (Platform.isAndroid || Platform.isIOS) {
      switch (bank) {
        case Bank.AccessBank:
          openUrl(
              androidId: "com.accessbank.nextgen&hl=en",
              appleId: "access-more/id1501024389");

          break;
        case Bank.AccessDiamond:
          openUrl(
              androidId: "com.accessbank.nextgen&hl=en",
              appleId: "access-more/id1501024389");
          break;
        case Bank.AlatByWema:
          openUrl(
              androidId: "com.wemabank.alat.prod",
              appleId: "alat/id1222853161?mt=8");
          break;
        case Bank.AsoSavings:
          break;
        case Bank.BowenBank:
          break;
        case Bank.CEMCSBank:
          openUrl(
              androidId: "com.appzonegroup.internetbanking.cemcs&hl=en&gl=US",
              appleId: "cemcs-mfb-mobile/id1465274178");
          break;
        case Bank.CitiBank:
          openUrl(
              androidId: "com.citi.citimobile",
              appleId: "citi-mobile-sm/id301724680");
          break;
        case Bank.EcoBank:
          openUrl(
              androidId: "com.app.ecobank",
              appleId: "ecobank-mobile-app/id1017658759");
          break;
        case Bank.EkondoBank:
          break;
        case Bank.FidelityBank:
          openUrl(
              androidId: "com.interswitchng.www&hl=en",
              appleId: "fidelity-online-banking/id1051038075");
          break;
        case Bank.FirstBank:
          openUrl(
              androidId: "com.firstbank.firstmobile&hl=en&gl=US",
              appleId: "firstmobile-app/id1039809331");
          break;
        case Bank.FCMB:
          openUrl(
              androidId: "com.appzonegroup.fcmb",
              appleId:
                  "https://apps.apple.com/ng/app/fcmb-new-mobile/id1444638628");
          break;
        case Bank.GlobusBank:
          openUrl(
              androidId: "com.nero.globus_mobile&hl=en&gl=US",
              appleId: "globus-mobile/id1487557023");
          break;
        case Bank.Gtbank:
          openUrl(
              androidId: "com.vanso.gtbankapp&hl=en",
              appleId: "gtbank/id573523974");
          break;
        case Bank.HasalBank:
          openUrl(
              androidId: "com.iswbanking.hasalapp&hl=en&gl=US",
              appleId: "hasal-microfinance-bank/id1497271404");
          break;
        case Bank.HeritageBank:
          openUrl(
              androidId: "com.heritagebank.heritagebank&hl=en&gl=US",
              appleId: "hb-padie-by-heritage-bank/id1076292826");
          break;
        case Bank.JaizBank:
          openUrl(
              androidId: "com.jaizbank.app&hl=en",
              appleId: "jaizmobile/id991728720");
          break;
        case Bank.KeystoneBank:
          openUrl(
              androidId: "com.qucoon.keystonemobilebankingapp&hl=en&gl=US",
              appleId: "keymobile/id1332114961");
          break;
        case Bank.KudaBank:
          openUrl(
              androidId: "com.kudabank.app&hl=en&gl=US",
              appleId: "the-bank-of-the-free-kuda/id1467373738");
          break;
        case Bank.OneFinance:
          openUrl(
              androidId: "com.onefinance.one&hl=en&gl=US",
              appleId: "one-mobile-banking/id1494523953");
          break;
        case Bank.Paga:
          openUrl(
              androidId: "com.mypaga.customer&hl=en&gl=US",
              appleId: "paga/id1362357426");
          break;
        case Bank.ParallexBank:
          openUrl(
              androidId: "com.parallexbankng.personalbanking&hl=en",
              appleId: "parallex-mobile-app/id1586321123");
          break;
        case Bank.Paycom:
          openUrl(
              androidId: "com.paycom.mobile.ess&hl=en&gl=US",
              appleId: "paycom/id1207929487?ls=1");
          break;
        case Bank.PolarisBank:
          openUrl(androidId: "com.vulte.app", appleId: "vulte/id1541640258");
          break;
        case Bank.ProvidusBank:
          openUrl(
              androidId:
                  "com.appzonegroup.dejavuandroid.providus.release&hl=en&gl=US",
              appleId: "providusmobile/id1321819992");
          break;
        case Bank.RubiesMFB:
          openUrl(
              androidId: "com.qucoon.rubies", appleId: "rubies/id1458430556");
          break;
        case Bank.SparkleBank:
          openUrl(
              androidId: "details?id=ng.sparkle.Sparkle_android.prod",
              appleId: "sparkle-lifestyle-finance/id1475491602");
          break;
        case Bank.StambicIBTC:
          openUrl(
              androidId: "com.stanbicibtc.mobile&hl=en",
              appleId: "stanbic-ibtc-mobile-app/id1167007240");
          break;
        case Bank.StandardCharteredBank:
          openUrl(
              androidId: "com.sc.breezenigeria.banking&hl=en&gl=US",
              appleId: "sc-mobile-nigeria/id650746202");
          break;
        case Bank.SterlingBank:
          openUrl(
              androidId: "com.sterlingng.sterlingmobile&hl=en&gl=US",
              appleId: "sterling-onebank/id1489139430");
          break;
        case Bank.SunTrustBank:
          openUrl(
              androidId: "com.digicore.suntrust&hl=en&gl=US",
              appleId: "suntrust-bank-mobile/id1570492978");
          break;
        case Bank.TAJBank:
          openUrl(
              androidId: "com.tajbank.app&hl=en&gl=US",
              appleId: "mytaj/id1489599682");
          break;
        case Bank.TCFMFB:
          break;
        case Bank.TitanTrustBank:
          openUrl(
              androidId: "com.titantrustbank.titan1&hl=en&gl=US",
              appleId: "titan-trust-mobile-banking/id1488380647");
          break;
        case Bank.UnionBank:
          openUrl(
              androidId: "com.ceva.ubmobile.stallion&hl=en&gl=US",
              appleId: "unionmobile/id1253595309");
          break;
        case Bank.UnityBank:
          openUrl(
              androidId: "com.teamapt.unitymobile&hl=en&gl=US",
              appleId: "unifi-by-unity-bank/id1433927004");
          break;
        case Bank.VFD:
          openUrl(
              androidId: "com.vfd.app&hl=en&gl=US",
              appleId: "v-by-vfd/id1462870303");
          break;
        case Bank.WemaBank:
          openUrl(
              androidId: "com.wema.mobilepass&hl=en&gl=US",
              appleId: "wema-bank-mobilepass/id1582348672");
          break;
        case Bank.ZenithBank:
          openUrl(androidId: "", appleId: "");
          break;
        case Bank.UBA:
          openUrl(
              androidId:
                  "com.ubanquity.redd.uba&ah=GynnPSlSEeq0ldEs9Tbq2nMBpw8",
              appleId: "uba-mobile-app/id1529761664");
          break;
        default:
      }
    }
  }

  static Future<bool> openUrl(
      {required String androidId, required String appleId}) {
    return launchUrl(
        Uri.parse(
          Platform.isAndroid
              ? "https://play.google.com/store/apps/details?id=$androidId"
              : "https://itunes.apple.com/us/app/$appleId",
        ),
        mode: LaunchMode.externalApplication);
  }
}
