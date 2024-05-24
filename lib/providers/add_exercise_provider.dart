import 'dart:convert';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monkeybox_dhruvi/common/extension/text_style_extensions.dart';
import 'package:monkeybox_dhruvi/common/extension/widget_extension.dart';
import 'package:monkeybox_dhruvi/providers/home_provider.dart';
import 'package:monkeybox_dhruvi/screens/home/edit_exercise.dart';
import 'package:monkeybox_dhruvi/screens/home/extensions.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config.dart';
import '../model/exercise_model.dart';
import '../screens/home/filter_muscles.dart';
import '../widgets/button_common.dart';

class AddExerciseProvider extends ChangeNotifier{

  Data? exercise;

  saveExercise(context)async{
    final home = Provider.of<HomeProvider>(context,listen: false);
    SharedPreferences pref = await SharedPreferences.getInstance();
    home.addedList.add(AddNewExercise(title: home.controller.text,data: home.newAddList));
    List<String> personsEncoded =
    home.addedList.map((person) => jsonEncode(person.toJson())).toList();
    pref.setString("exerciseList", json.encode(personsEncoded));
    notifyListeners();
    home.controller.text = "";
    notifyListeners();
  }

  init(){
    exercise!.sets = [
      SetData(
          kgController: TextEditingController(),
          repsController: TextEditingController())
    ];
  }

  onExerciseShow(index,context){
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return  Consumer<HomeProvider>(
            builder: (context1,home,child) {
              return StatefulBuilder(builder: (context, setstate) {
                return SizedBox(
                    height: Sizes.s470,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ListView(children: [
                          Text(home.addedList[index].title!,style: appCss.dmSansMedium16.textColor(appColor(context).darkText),),
                          const VSpace(Sizes.s20),
                          Divider(),
                          Column(
                            children: [...home.addedList[index].data!.asMap().entries.map((e) =>
                                Container(
                                  margin: const EdgeInsets.only(
                                      bottom: Sizes.s10),
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
                                              color: appColor(context)
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
                                            Expanded(child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(e.value.name!),

                                                Text("${e.value.sets!.length} sets"),
                                              ],
                                            )),
                                            const VSpace(Sizes.s5)
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ))],
                          )
                        ]).paddingSymmetric(horizontal: Sizes.s20).paddingSymmetric(vertical: Sizes.s20),
                        ButtonCommon(
                          title: 'Edit Exercise',
                          margin: Sizes.s20,
                          color: appColor(context).darkText,
                          onTap: ()async{
                            home.controller.text =home.addedList[index].title!;
                            home.newAddList = home.addedList[index].data!;
                            home.notifyListeners();
                            home.addExericeDialog(context,index:index);


/*

                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EditExercise(exercise: home.addedList[index]!)),
                            );
*/



                           /* if (result != null) {
                              setState(() {
                                exercises[index] = result;
                              });
                            }
*/

                          },
                          radius: 100,
                          style: appCss.dmSansMedium16.textColor(appColor(context).stroke),
                        ).marginOnly(bottom: Sizes.s20)
                      ],
                    )).bottomSheetExtension(context);
              });
            }
          );
        });

  }
}