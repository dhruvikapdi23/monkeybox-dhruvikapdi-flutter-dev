import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monkeybox_dhruvi/common/extension/text_style_extensions.dart';
import 'package:monkeybox_dhruvi/common/extension/widget_extension.dart';
import 'package:monkeybox_dhruvi/config.dart';
import 'package:monkeybox_dhruvi/providers/home_provider.dart';
import 'package:monkeybox_dhruvi/widgets/button_common.dart';
import 'package:monkeybox_dhruvi/widgets/common_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context,home,child) {
        return StatefulWrapper(
          onInit: ()=> Future.delayed(DurationClass.ms50).then((_) => home.onInit()),
          child: Scaffold(
            backgroundColor: appColor(context).bgColor,
            body: DefaultTabController(
              length: 2,
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: Sizes.s50),
                children: [
                  Text(
                    appFonts.activities,
                    style: appCss.dmSansBold20.textColor(appColor(context).darkText),
                  ).marginSymmetric(horizontal: Sizes.s20),
                  const VSpace(Sizes.s10),
                  Divider(
                    color: appColor(context).stroke,
                    height: 0,
                  ),
                  TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    isScrollable: true,
                    padding: EdgeInsets.zero,
                    tabAlignment: TabAlignment.start,
                    dividerColor: appColor(context).stroke,
                    indicatorColor: appColor(context).darkText,
                    indicatorWeight: 1,
                    indicator: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: appColor(context).darkText, width: 1))),
                    tabs: [
                      Tab(
                          icon: Container(),
                          child: Text(appFonts.overview,
                                  style: appCss.dmSansMedium16
                                      .textColor(appColor(context).darkText))
                              .marginOnly(bottom: Sizes.s5)),
                      Tab(
                          icon: Container(),
                          child: Text(appFonts.workoutPlans,
                                  style: appCss.dmSansMedium16
                                      .textColor(appColor(context).darkText))
                              .marginOnly(bottom: Sizes.s5)),
                    ],
                  ).height(40),
                  const VSpace(Sizes.s30),
                  SizedBox(
                    height: 500,
                    child: TabBarView(
                      children: [
                        Column(),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(appFonts.strengthTraining,
                                    style: appCss.dmSansSemiBold16
                                        .textColor(appColor(context).darkText)),
                                Text(appFonts.totalSaveExercise("2"),
                                    style: appCss.dmSansMedium16
                                        .textColor(appColor(context).lightText)),
                              ],
                            ).marginSymmetric(horizontal: Sizes.s20),
                            ...home.exerciseList.asMap().entries.map((e) => Container()),
                            const VSpace(Sizes.s40),
                            ButtonCommon(
                              title: appFonts.addWorkoutPlan,
                              icon: Icon(
                                Icons.add,
                                size: 16
                              ),
                              onTap: ()=> home.addExericeDialog(context),
                              margin: Sizes.s20,
                              radius: 50,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
