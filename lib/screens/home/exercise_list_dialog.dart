import 'dart:developer';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:monkeybox_dhruvi/common/extension/text_style_extensions.dart';
import 'package:monkeybox_dhruvi/common/extension/widget_extension.dart';
import 'package:provider/provider.dart';

import '../../config.dart';
import '../../providers/home_provider.dart';
import '../../widgets/button_common.dart';

class ExerciseListDialog extends StatelessWidget {
  const ExerciseListDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, home, child) {
      return StatefulBuilder(builder: (context, setstate) {
        return SafeArea(
          bottom: false,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shrinkWrap: true,
            controller: ModalScrollController.of(context),
            children: [
              CupertinoTextField(
                controller: home.search,
                onChanged: (val) {
                  if (val.isNotEmpty) {
                    for (var d in home.exerciseModelList) {
                      log("dfhj :${d.name}");
                      if (d.name!
                          .replaceAll(" ", "")
                          .toLowerCase()
                          .contains(home.search.text)) {
                        if (!home.searchList.contains(d)) {
                          home.searchList.add(d);
                        }
                      }
                      setstate;
                      home.notifyListeners();
                    }
                  } else {
                    home.searchList = [];
                    home.notifyListeners();
                  }
                },
                style: appCss.dmSansMedium16.textColor(Colors.blue),
                placeholder: "Search",
                decoration: BoxDecoration(
                    color: const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: const Color(0xFFF6F6F6))),
              ),
              const VSpace(Sizes.s11),
              Row(
                children: [
                  Expanded(
                      child: ButtonCommon(
                    title: "All Groups",
                    onTap: () => home.showBookingStatus(context),
                    icon: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 10,
                    ),
                    isShadow: true,
                    color: appColor(context).whiteColor,
                  )),
                  const HSpace(Sizes.s11),
                  Expanded(
                      child: ButtonCommon(
                          isShadow: true,
                          onTap: ()=> home.filterEquipmentSheet(context),
                          icon: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 10,
                          ),
                          title: "All equipment",
                          color: appColor(context).whiteColor)),
                ],
              ),
              const VSpace(Sizes.s11),
              home.search.text.isNotEmpty
                  ? Column(
                      children: [
                        ...home.searchList.asMap().entries.map((e) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: Sizes.s10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: Sizes.s8, vertical: Sizes.s8),
                            decoration: ShapeDecoration(
                                color: home.newAddList.contains(e.value)
                                    ? const Color(0xFFFCF0E9)
                                    : appColor(context).whiteColor,
                                shadows: const [
                                  BoxShadow(
                                      color: Color(0xFFF5F5F5), blurRadius: 12)
                                ],
                                shape: SmoothRectangleBorder(
                                    side: BorderSide(
                                        color: home.newAddList.contains(e.value)
                                            ? const Color(0xffFA7F3A)
                                            : appColor(context).whiteColor),
                                    borderRadius: const SmoothBorderRadius.all(
                                        SmoothRadius(
                                            cornerRadius: Sizes.s10,
                                            cornerSmoothing: 1)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    e.value.headerImage != null
                                        ? Container(
                                            height: Sizes.s30,
                                            width: Sizes.s30,
                                            decoration: ShapeDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      e.value.headerImage!,
                                                    ),
                                                    fit: BoxFit.cover),
                                                color: appColor(context)
                                                    .whiteColor,
                                                shape: const SmoothRectangleBorder(
                                                    borderRadius:
                                                        SmoothBorderRadius.all(
                                                            SmoothRadius(
                                                                cornerRadius:
                                                                    Sizes.s6,
                                                                cornerSmoothing:
                                                                    1)))))
                                        : Container(
                                            height: Sizes.s40,
                                            width: Sizes.s40,
                                            alignment: Alignment.center,
                                            decoration: ShapeDecoration(
                                                color: appColor(context)
                                                    .whiteColor,
                                                shape: const SmoothRectangleBorder(
                                                    borderRadius:
                                                        SmoothBorderRadius.all(
                                                            SmoothRadius(
                                                                cornerRadius:
                                                                    Sizes.s6,
                                                                cornerSmoothing:
                                                                    1)))),
                                            child: Text(e.value.name![0]),
                                          ),
                                    const HSpace(Sizes.s10),
                                    Text(e.value.name!),
                                    const VSpace(Sizes.s5)
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: Sizes.s20,
                                  width: Sizes.s20,
                                  decoration: BoxDecoration(
                                      color: home.newAddList.contains(e.value)
                                          ? const Color(0xffFA7F3A)
                                          : Colors.transparent,
                                      border: Border.all(
                                          color: home.newAddList
                                                  .contains(e.value)
                                              ? const Color(0xffFA7F3A)
                                              : appColor(context).lightText)),
                                  child: home.newAddList.contains(e.value)
                                      ? Icon(
                                          Icons.check,
                                          size: 14,
                                          color: appColor(context).whiteBg,
                                        )
                                      : Container(),
                                ).inkWell(onTap: () {
                                  if (!home.newAddList.contains(e.value)) {
                                    home.newAddList.add(e.value);
                                  } else {
                                    home.newAddList.remove(e.value);
                                  }
                                  home.notifyListeners();
                                })
                              ],
                            ),
                          );
                        })
                      ],
                    )
                  : home.searchList.isNotEmpty
                      ? Column(children: [
                          ...home.searchList.asMap().entries.map((e) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: Sizes.s10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Sizes.s8, vertical: Sizes.s8),
                              decoration: ShapeDecoration(
                                  color: home.newAddList.contains(e.value)
                                      ? const Color(0xFFFCF0E9)
                                      : appColor(context).whiteColor,
                                  shadows: const [
                                    BoxShadow(
                                        color: Color(0xFFF5F5F5),
                                        blurRadius: 12)
                                  ],
                                  shape: SmoothRectangleBorder(
                                      side: BorderSide(
                                          color: home.newAddList
                                                  .contains(e.value)
                                              ? const Color(0xffFA7F3A)
                                              : appColor(context).whiteColor),
                                      borderRadius: const SmoothBorderRadius.all(
                                          SmoothRadius(
                                              cornerRadius: Sizes.s10,
                                              cornerSmoothing: 1)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        e.value.headerImage != null
                                            ? Container(
                                                height: Sizes.s30,
                                                width: Sizes.s30,
                                                decoration: ShapeDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          e.value.headerImage!,
                                                        ),
                                                        fit: BoxFit.cover),
                                                    color: appColor(context)
                                                        .whiteColor,
                                                    shape: const SmoothRectangleBorder(
                                                        borderRadius:
                                                            SmoothBorderRadius
                                                                .all(SmoothRadius(
                                                                    cornerRadius:
                                                                        Sizes.s6,
                                                                    cornerSmoothing:
                                                                        1)))))
                                            : Container(
                                                height: Sizes.s40,
                                                width: Sizes.s40,
                                                alignment: Alignment.center,
                                                decoration: ShapeDecoration(
                                                    color: appColor(context)
                                                        .whiteColor,
                                                    shape: const SmoothRectangleBorder(
                                                        borderRadius:
                                                            SmoothBorderRadius
                                                                .all(SmoothRadius(
                                                                    cornerRadius:
                                                                        Sizes.s6,
                                                                    cornerSmoothing:
                                                                        1)))),
                                                child: Text(e.value.name![0]),
                                              ),
                                        const HSpace(Sizes.s10),
                                        Expanded(child: Text(e.value.name!)),
                                        const VSpace(Sizes.s5)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: Sizes.s20,
                                    width: Sizes.s20,
                                    decoration: BoxDecoration(
                                        color: home.newAddList.contains(e.value)
                                            ? const Color(0xffFA7F3A)
                                            : Colors.transparent,
                                        border: Border.all(
                                            color: home.newAddList
                                                    .contains(e.value)
                                                ? const Color(0xffFA7F3A)
                                                : appColor(context).lightText)),
                                    child: home.newAddList.contains(e.value)
                                        ? Icon(
                                            Icons.check,
                                            size: 14,
                                            color: appColor(context).whiteBg,
                                          )
                                        : Container(),
                                  ).inkWell(onTap: () {
                                    if (!home.newAddList.contains(e.value)) {
                                      home.newAddList.add(e.value);
                                    } else {
                                      home.newAddList.remove(e.value);
                                    }
                                    home.notifyListeners();
                                  })
                                ],
                              ),
                            );
                          })
                        ])
                      : Column(
                          children: [
                            ...home.exerciseModelList.asMap().entries.map((e) {
                              return Container(
                                margin:
                                    const EdgeInsets.only(bottom: Sizes.s10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Sizes.s8, vertical: Sizes.s8),
                                decoration: ShapeDecoration(
                                    color: home.newAddList.contains(e.value)
                                        ? const Color(0xFFFCF0E9)
                                        : appColor(context).whiteColor,
                                    shadows: const [
                                      BoxShadow(
                                          color: Color(0xFFF5F5F5),
                                          blurRadius: 12)
                                    ],
                                    shape: SmoothRectangleBorder(
                                        side: BorderSide(
                                            color: home.newAddList
                                                    .contains(e.value)
                                                ? const Color(0xffFA7F3A)
                                                : appColor(context).whiteColor),
                                        borderRadius: const SmoothBorderRadius.all(
                                            SmoothRadius(
                                                cornerRadius: Sizes.s10,
                                                cornerSmoothing: 1)))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        e.value.headerImage != null
                                            ? Container(
                                                height: Sizes.s30,
                                                width: Sizes.s30,
                                                decoration: ShapeDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          e.value.headerImage!,
                                                        ),
                                                        fit: BoxFit.cover),
                                                    color: appColor(context)
                                                        .whiteColor,
                                                    shape: const SmoothRectangleBorder(
                                                        borderRadius:
                                                            SmoothBorderRadius
                                                                .all(SmoothRadius(
                                                                    cornerRadius:
                                                                        Sizes
                                                                            .s6,
                                                                    cornerSmoothing:
                                                                        1)))))
                                            : Container(
                                                height: Sizes.s40,
                                                width: Sizes.s40,
                                                alignment: Alignment.center,
                                                decoration: ShapeDecoration(
                                                    color: appColor(context)
                                                        .whiteColor,
                                                    shape: const SmoothRectangleBorder(
                                                        borderRadius:
                                                            SmoothBorderRadius
                                                                .all(SmoothRadius(
                                                                    cornerRadius:
                                                                        Sizes
                                                                            .s6,
                                                                    cornerSmoothing:
                                                                        1)))),
                                                child: Text(e.value.name![0]),
                                              ),
                                        const HSpace(Sizes.s10),
                                        Text(e.value.name!),
                                        const VSpace(Sizes.s5)
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: Sizes.s20,
                                      width: Sizes.s20,
                                      decoration: BoxDecoration(
                                          color:
                                              home.newAddList.contains(e.value)
                                                  ? const Color(0xffFA7F3A)
                                                  : Colors.transparent,
                                          border: Border.all(
                                              color: home.newAddList
                                                      .contains(e.value)
                                                  ? const Color(0xffFA7F3A)
                                                  : appColor(context)
                                                      .lightText)),
                                      child: home.newAddList.contains(e.value)
                                          ? Icon(
                                              Icons.check,
                                              size: 14,
                                              color: appColor(context).whiteBg,
                                            )
                                          : Container(),
                                    ).inkWell(onTap: () {
                                      if (!home.newAddList.contains(e.value)) {
                                        home.newAddList.add(e.value);
                                      } else {
                                        home.newAddList.remove(e.value);
                                      }
                                      home.notifyListeners();
                                    })
                                  ],
                                ),
                              );
                            })
                          ],
                        )
            ],
          ),
        );
      });
    });
  }
}
