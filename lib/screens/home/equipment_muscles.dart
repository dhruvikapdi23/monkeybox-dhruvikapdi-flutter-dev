
import 'dart:developer';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:monkeybox_dhruvi/common/extension/text_style_extensions.dart';
import 'package:monkeybox_dhruvi/common/extension/widget_extension.dart';
import 'package:monkeybox_dhruvi/screens/home/extensions.dart';
import 'package:provider/provider.dart';

import '../../config.dart';
import '../../providers/home_provider.dart';
import '../../widgets/button_common.dart';

class EquipmentMuscles extends StatelessWidget {
  const EquipmentMuscles({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, home, child) {
      return StatefulBuilder(builder: (context, setstate) {
        return SizedBox(
            height: Sizes.s470,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Filter By equiment Group",
                          style: appCss.dmSansMedium16
                              .textColor(appColor(context).darkText))
                          .center(),
                      const VSpace(Sizes.s20),
                      Container(
                        margin: const EdgeInsets.only(
                            bottom: Sizes.s10,left: Sizes.s20,right: Sizes.s20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.s8,
                            vertical: Sizes.s12),
                        decoration: ShapeDecoration(
                            color:
                            appColor(context).whiteColor,
                            shadows: [
                              const BoxShadow(
                                  color: Color(0xFFF5F5F5),
                                  blurRadius: 12)
                            ],
                            shape: SmoothRectangleBorder(
                                side: BorderSide(
                                    color:  appColor(context)
                                        .whiteColor),
                                borderRadius:
                                SmoothBorderRadius.all(
                                    SmoothRadius(
                                        cornerRadius: Sizes.s10,
                                        cornerSmoothing: 1)))),
                        child: Text("All groups",
                            style: appCss.dmSansMedium16
                                .textColor(appColor(context).darkText))
                            .inkWell(onTap: (){
                          home.searchList = [];
                          setstate;
                          home.notifyListeners();
                          route.pop(context);
                        }),
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Column(children: [
                                ...home.equipments.asMap().entries.map((e) =>
                                    Container(
                                      margin: const EdgeInsets.only(
                                          bottom: Sizes.s10),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: Sizes.s8,
                                          vertical: Sizes.s12),
                                      decoration: ShapeDecoration(
                                          color:
                                          home.filterEquipment.contains(e.value)
                                              ? Color(0xFFFCF0E9)
                                              : appColor(context).whiteColor,
                                          shadows: [
                                            const BoxShadow(
                                                color: Color(0xFFF5F5F5),
                                                blurRadius: 12)
                                          ],
                                          shape: SmoothRectangleBorder(
                                              side: BorderSide(
                                                  color: home.filterEquipment
                                                      .contains(e.value)
                                                      ? Color(0xffFA7F3A)
                                                      : appColor(context)
                                                      .whiteColor),
                                              borderRadius:
                                              SmoothBorderRadius.all(
                                                  SmoothRadius(
                                                      cornerRadius: Sizes.s10,
                                                      cornerSmoothing: 1)))),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(e.value.name!),
                                          Container(
                                            alignment: Alignment.center,
                                            height: Sizes.s20,
                                            width: Sizes.s20,
                                            decoration: BoxDecoration(
                                                color: home.filterEquipment
                                                    .contains(e.value)
                                                    ? const Color(0xffFA7F3A)
                                                    : Colors.transparent,
                                                border: Border.all(
                                                    color: home.filterEquipment
                                                        .contains(e.value)
                                                        ? const Color(0xffFA7F3A)
                                                        : appColor(context)
                                                        .lightText)),
                                            child: home.filterEquipment
                                                .contains(e.value)
                                                ? Icon(
                                              Icons.check,
                                              size: 14,
                                              color:
                                              appColor(context).whiteBg,
                                            )
                                                : Container(),
                                          ).inkWell(onTap: () {
                                            if (!home.filterEquipment
                                                .contains(e.value)) {
                                              home.filterEquipment.add(e.value);
                                            } else {
                                              home.filterEquipment.remove(e.value);
                                            }
                                            home.notifyListeners();
                                            setstate;
                                          })
                                        ],
                                      ),
                                    ))
                              ]).paddingSymmetric(horizontal: Sizes.s20)))
                    ]).paddingSymmetric(vertical: Sizes.s20),
                ButtonCommon(
                  title: 'Filter By "${home.filterEquipment.length} muscles"',
                  margin: Sizes.s20,
                  color: appColor(context).darkText,
                  onTap: (){
                    log("sdjhf ");
                    home.searchList =[];
                    home.filterEquipment.asMap().entries.forEach((e) {
                      for(var d in home.exerciseModelList){

                        d.equipments!.asMap().entries.forEach((element) {
                          if(element.value.name.toString().toLowerCase().contains(e.value.name!.toLowerCase())){
                            home.searchList.add(d);
                          }
                        });
                        home.notifyListeners();
                      }
                      log("searchList :${home.searchList.length}");
                    });
                    route.pop(context);


                  },
                  radius: 100,
                  style: appCss.dmSansMedium16.textColor(appColor(context).whiteColor),
                ).marginOnly(bottom: Sizes.s20)
              ],
            )).bottomSheetExtension(context);
      });
    });
  }
}
