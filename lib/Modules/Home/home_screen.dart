import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Shared/Components/components.dart';
import '../../Shared/Cubit/cubit.dart';
import '../../Shared/Cubit/states.dart';
import '../../Shared/Style/color.dart';
import '../../Shared/Style/theme.dart';
import '../history_screen/heart_details_screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Logo(
                  height: size.height * 0.05,
                  width: size.width * 0.2,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 15.h,
                              ),
                              Image.asset(
                                "assets/icons/homeCircles.png",
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "نبضة/دقيقة",
                                    style: caption(),
                                  ),
                                  Text(
                                    "65",
                                    style: headLine().copyWith(color: blackColor, fontSize: 60.sp,),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "< نبضة في الدقيقة  ",
                                    style: caption(),
                                  ),
                                  Image.asset("assets/icons/~.png"),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "30C",
                                    style: headLine().copyWith(color: blackColor,),
                                  ),
                                  Image.asset(
                                    "assets/icons/temp.png",
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: (){
                                  navigateTo(context, HeartDetailsHistory(),);
                                },
                                child: Text(
                                  "< درجة الحرارة",
                                  style: caption(),
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "82%",
                                    style: headLine().copyWith(color: blackColor,),
                                  ),
                                  Image.asset(
                                    "assets/icons/oxegen.png",
                                  ),
                                ],
                              ),
                              Text(
                                "< الاكسجين",
                                style: caption(),
                              )
                            ],
                          ),
                        ],
                      ),
                      Text(
                        "اليوم, 21 فبراير",
                        style: bodyText().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "البطارية منخفضة 25%",
                        style: caption(),
                      ),
                      Text(
                        "يرجي شحن البطارية",
                        style: caption(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BuildTab(
                        onPressTab: () {
                          cubit.changeTabScreen(2);
                        },
                        title: 'درجة الحرارة',
                        image: "assets/icons/temp2.png",
                        tabColor: greenColor,
                      ),
                      BuildTab(
                        onPressTab: () {
                          cubit.changeTabScreen(1);
                        },
                        title: 'الاكسجين',
                        image: "assets/icons/oxegen2.png",
                        tabColor: primaryColor,
                      ),
                      BuildTab(
                        onPressTab: () {
                          cubit.changeTabScreen(0);
                        },
                        title: 'القلب',
                        image: "assets/icons/~2.png",
                        tabColor: redColor,
                      ),
                    ],
                  ),
                ),
                cubit.tabScreens[cubit.currentTabIndex],
              ],
            ),
          ),
        );
      },
    );
  }
}
