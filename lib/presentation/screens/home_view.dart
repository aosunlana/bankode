import 'package:bankode/cubit/bank_cubit.dart';
import 'package:bankode/cubit/bank_state.dart';
import 'package:bankode/data/models/banks.dart';
import 'package:bankode/presentation/components/utils/constants.dart';
import 'package:bankode/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatefulWidget {
  final String nickName;
  const HomeView({Key? key, required this.nickName}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<NigerianBankCubit>().loadBankList();
    NigerianBankCubit.userGreeting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(16),
                vertical: ScreenUtil().setWidth(16)),
            child: Column(
              children: [
                SizedBox(
                  height: ScreenUtil().setHeight(19),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: ScreenUtil().setWidth(54),
                          width: ScreenUtil().setWidth(54),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.12),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/avatar.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(21)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Good ${NigerianBankCubit.userGreeting()}',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(16),
                                    fontWeight: FontWeight.w300)),
                            Text(
                              widget.nickName.toString(),
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(20),
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () => '',
                        icon: SvgPicture.asset(
                          'assets/icons/info-icon.svg',
                        ))
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(27),
                ),
                Material(
                  elevation: ScreenUtil().setSp(5),
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  child: Container(
                    width: ScreenUtil().setWidth(341),
                    height: ScreenUtil().setHeight(132),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(20),
                          horizontal: ScreenUtil().setWidth(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your current Location',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                                fontWeight: FontWeight.w400),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Lagos, NG', style: TextStyle(fontSize: ScreenUtil().setSp(28), fontWeight: FontWeight.w700),),
                              SizedBox(
                                height: ScreenUtil().setHeight(70),
                                width: ScreenUtil().setWidth(70),
                                child: Image.asset(
                                  'assets/images/weather.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      color: kWeatherContainerColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(44),
                ),
                Center(
                  child: Text('MY BANK LIST',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(15),
                          fontWeight: FontWeight.w700)),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(18),
                ),
                Material(
                  elevation: ScreenUtil().setSp(10),
                  shadowColor: const Color(0XFFE5E5E5),
                  borderRadius: BorderRadius.all(Radius.circular(7.r)),
                  child: TextField(
                    style: TextStyle(fontSize: ScreenUtil().setHeight(20)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kPrimaryColor,
                      focusColor: kBackgroundColor,
                      prefixIcon: IconButton(
                          onPressed: () => '',
                          icon: SvgPicture.asset(
                            'assets/icons/search-icon.svg',
                            width: 24,
                            height: 24,
                          )),
                      hintText: 'Search here',
                      hintStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(18),
                          color: const Color(0XFF838BAA)),
                      suffixIcon: IconButton(
                          onPressed: () => '',
                          icon: SvgPicture.asset(
                            'assets/icons/mic-icon.svg',
                            width: 24,
                            height: 24,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.r)),
                          borderSide: const BorderSide(color: kPrimaryColor)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.r)),
                          borderSide: const BorderSide(color: kPrimaryColor)),
                    ),
                    onChanged: (value) async {
                      await context.read<NigerianBankCubit>().runFilter(value);
                    },
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(25),
                ),
                BlocBuilder<NigerianBankCubit, NigerianBankState>(
                    builder: (context, state) {
                  if (state is NigerianBankLoadingState) {
                    return Shimmer.fromColors(
                      highlightColor: const Color(0xFFF5F5F5),
                      baseColor: const Color(0xFFBDBDBD),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(20)),
                          child: Material(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r)),
                            child: Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [],
                              ),
                              width: ScreenUtil().setWidth(342),
                              height: ScreenUtil().setWidth(85),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)),
                                  color: kPrimaryColor),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else if (state is NigerianBankLoadedState) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.bankList.length,
                        itemBuilder: (context, index) {
                          List<Banks> bankList = state.bankList;
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setHeight(7)),
                            child: InkWell(
                              onTap: () => Navigator.of(context).pushNamed(
                                  RouteGenerator.bankInfo,
                                  arguments: bankList[index]),
                              child: Material(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r)),
                                child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: ScreenUtil().setWidth(15)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: ScreenUtil().setWidth(54),
                                          width: ScreenUtil().setWidth(54),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Colors.black.withOpacity(0.12),
                                          ),
                                          child: ClipOval(
                                            child: Image.network(
                                              bankList[index].logo,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: ScreenUtil().setWidth(19),
                                        ),
                                        Text(
                                          bankList[index].name,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                  width: ScreenUtil().setWidth(342),
                                  height: ScreenUtil().setWidth(85),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(26.r)),
                                      color: kPrimaryColor),
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return const SizedBox.shrink();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: kBackgroundColor,
    );
  }
}
