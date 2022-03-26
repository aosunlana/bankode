import 'package:bankode/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import 'cubit/bank_cubit.dart';
import 'data/data_providers/constants/api_constant.dart';
import 'data/data_providers/nigerian_bank_api_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final cameras = await availableCameras();
  // final firstCamera = cameras.first;

  runApp(const BankodeApp());
}

class BankodeApp extends StatelessWidget {
  const BankodeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NigerianBankCubit>(
      create: (BuildContext context) => NigerianBankCubit(NigerianBankApiClient(
        url: ApiConstant(),
        client: Client(),
      )),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bankode App',
          theme: ThemeData(
              primarySwatch: Colors.pink,
              textTheme:
                  GoogleFonts.rubikTextTheme(Theme.of(context).textTheme)),
          builder: (context, child) {
            return AnnotatedRegion<SystemUiOverlayStyle>(
              child: child!,
              value: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarColor: Color(0XFFFFFFFF),
                systemNavigationBarIconBrightness: Brightness.dark,
              ),
            );
          },
          onGenerateTitle: (context) => "Bankode App",
          initialRoute: RouteGenerator.onboardingView,
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    );
  }
}
