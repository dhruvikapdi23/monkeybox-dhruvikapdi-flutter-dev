import 'dart:convert';
import 'dart:developer';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:monkeybox_dhruvi/common/extension/text_style_extensions.dart';
import 'package:monkeybox_dhruvi/common/extension/widget_extension.dart';
import 'package:monkeybox_dhruvi/model/exercise_model.dart';
import 'package:monkeybox_dhruvi/providers/add_exercise_provider.dart';
import 'package:monkeybox_dhruvi/screens/home/add_exercise_dialog.dart';
import 'package:monkeybox_dhruvi/screens/home/edit_exercise.dart';
import 'package:monkeybox_dhruvi/screens/home/equipment_muscles.dart';
import 'package:monkeybox_dhruvi/screens/home/exercise_list_dialog.dart';
import 'package:monkeybox_dhruvi/screens/home/filter_muscles.dart';
import 'package:monkeybox_dhruvi/widgets/button_common.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config.dart';

class HomeProvider extends ChangeNotifier {
  List exerciseList = [];
  List<Data> newAddList = [];
  List<AddNewExercise> addedList = [];

  List saveDataList = [];
  final List<TextEditingController> controllersList = [];
  List<Row> textFieldRows = [];

  List<Data> exerciseModelList = [];
  List<Data> searchList = [];
  double susItemHeight = 40;
  List<MainMuscles> muscleGroup = [], filterMuscleList = [];
  List<Equipments> equipments = [], filterEquipment = [];
  TextEditingController controller = TextEditingController();
  TextEditingController search = TextEditingController();

  onInit()async {
    rootBundle.loadString('asset/exercise.json').then((value) {
      dynamic data = json.decode(value);
      List list = data['entity']['data'];
      for (var v in list) {
        exerciseModelList.add(Data.fromJson(v));
      }
      notifyListeners();
      exerciseModelList.asMap().entries.forEach((element) {
        element.value.mainMuscles!.asMap().entries.forEach((e) {
          if (!muscleGroup.contains(e.value)) {
            muscleGroup.add(e.value);
          }
        });
        element.value.equipments!.asMap().entries.forEach((e) {
          if (!equipments.contains(e.value)) {
            equipments.add(e.value);
          }
        });
        log("ehfsdhkf :${muscleGroup.length}");
      });

      notifyListeners();
    });
    log("EXPER :${muscleGroup.length}");
SharedPreferences preferences = await SharedPreferences.getInstance();
    final rawJson = preferences.getString("exerciseList");

    debugPrint("rawJson : $rawJson");
    if (rawJson != null) {
      List<dynamic> listMap = jsonDecode(rawJson);
      debugPrint("map : $listMap");
      addedList = listMap.map((e) {
        log(" json.decode(e)['isPackage']:${json.decode(e)}");
        AddNewExercise data =  json.decode(e);

        return data;
      }).toList();
    }
    notifyListeners();
  }

  totalExercise(context,index) {

    return addedList[index].data!.fold(0, (previousValue, element) => element.sets!.fold(0, (i, j) => int.parse(j.kgController.text) + int.parse(j.kgController.text.toString())));
  }

  totalSet(context) {

    return newAddList
        .fold(0, (i, j) => i + (j.sets == null ? 0 : j.sets!.length));
  }

  addExericeDialog(context,{index}) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) =>
            Theme(data: ThemeData.dark(), child:  AddExerciseDialog(index: index,)));
  }

  showModalSheet(context,{index}) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Material(
          child: CupertinoPageScaffold(
        backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
          middle: Text(
            controller.text,
            style:
                appCss.dmSansSemiBold18.textColor(appColor(context).darkText),
          ),
          leading: Icon(
            Icons.arrow_back_ios,
            color: appColor(context).darkText,
            size: 18,
          ).inkWell(onTap: () => route.pop(context)),
          trailing: CupertinoButton(
            child: Text(appFonts.save),
            padding: EdgeInsets.zero,
            onPressed: () {},
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shrinkWrap: true,
            controller: ModalScrollController.of(context),
            children: [
              Text(
                controller.text,
                style: appCss.dmSansSemiBold24
                    .textColor(appColor(context).darkText),
              ),
              const VSpace(Sizes.s5),
              Text(
                appFonts.startByAddingExercise,
                style: appCss.dmSansMedium14
                    .textColor(const Color(0xFF6C6B70))
                    .textHeight(1),
              ),
              const VSpace(Sizes.s40),
              ButtonCommon(
                onTap: () {
                  showExerciseModalSheet(context,index: index);
                },
                title: appFonts.addExercise,
                color: const Color(0xFF0E0E14),
                style:
                    appCss.dmSansMedium16.textColor(appColor(context).whiteBg),
                radius: 50,
                icon: Icon(
                  Icons.add,
                  size: 15,
                  color: appColor(context).whiteBg,
                ),
              ),
              const VSpace(Sizes.s10),
              ButtonCommon(
                title: appFonts.deleteExercise,
                color: const Color(0xFFFCF0E9),
                style: appCss.dmSansMedium16.textColor(const Color(0xffFA7F3A)),
                radius: 50,
              )
            ],
          ),
        ),
      )),
    );
  }

  showBookingStatus(context) {
    log("dskghdrjg");
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return const FilterMuscles();
        });
  }

  filterEquipmentSheet(context) {
    log("dskghdrjg");
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return const EquipmentMuscles();
        });
  }

  showExerciseModalSheet(context,{index}) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Material(
          child: Scaffold(
        body: CupertinoPageScaffold(
          backgroundColor: const Color(0xFFFFFFFF),
          navigationBar: CupertinoNavigationBar(
            backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
            middle: Text(appFonts.library,
                style: appCss.dmSansSemiBold18
                    .textColor(appColor(context).darkText)),
            leading:
                Text(appFonts.cancel).inkWell(onTap: () {
                  controller.text ="";
                  notifyListeners();
                  route.pop(context);
                }),
            trailing: Text(appFonts.add)
                .inkWell(onTap: () => addDetailSheet(context,index: index)),
          ),
          child: const ExerciseListDialog(),
        ),
      )),
    );
  }

  addDetailSheet(context,{index}) {
/*    controllersList = [];
    textFieldRows = [];
    notifyListeners();
    addNewTextFieldPair(context);*/
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) =>
          Consumer<AddExerciseProvider>(builder: (context, exe, child) {
            log("EDIT ::$newAddList");
        return StatefulBuilder(builder: (context, setstate) {
          return Material(
              child: Scaffold(
            appBar: AppBar(
              actions: [
                Text(
                  "Save",
                  style: appCss.dmSansSemiBold14
                      .textColor(appColor(context).darkText),
                ).paddingSymmetric(horizontal: Sizes.s20).inkWell(onTap: (){
                  final add = Provider.of<AddExerciseProvider>(context,listen: false);
                  add.saveExercise(context);
                  route.pop(context);
                  route.pop(context);
                  route.pop(context);
                  route.pop(context);


                })
              ],
            ),
            body: ListView(
              children: [
                Text(
                  "${newAddList.length} exercises, ${totalSet(context)} sets",
                  style: appCss.dmSansMedium16
                      .textColor(appColor(context).darkText),
                ).paddingSymmetric(horizontal: Sizes.s20),
                const VSpace(Sizes.s20),


                Column(
                  children: [
                    ...newAddList.asMap().entries.map((e) => ExerciseCard(
                      exercise: e.value,

                      onAddSet: (p0) {
                        newAddList[e.key].sets!.add(p0);
                        notifyListeners();
                      },
                      index: e.key,
                      onDelete: () {},
                      onEdit: () {},
                    ))
                  ],
                )
              ],
            ),
          ));
        });
      }),
    );
  }

  void saveData(context) {
    final home = Provider.of<HomeProvider>(context, listen: false);

    log("CONTE L:$controllersList");
  }

  Widget bottomAppBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.5,
            color: CupertinoColors.separator.resolveFrom(context),
          ),
        ),
        color: CupertinoTheme.of(context).barBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CupertinoButton(
            child: const Icon(
              CupertinoIcons.share,
              size: 28,
            ),
            onPressed: () {},
          ),
          const CupertinoButton(
            child: Icon(CupertinoIcons.heart, size: 28),
            onPressed: null,
          ),
          const CupertinoButton(
            child: Icon(CupertinoIcons.delete, size: 28),
            onPressed: null,
          )
        ],
      ),
    );
  }
}

class ExerciseCard extends StatefulWidget {
  final Data exercise;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final Function(SetData) onAddSet;
  final int? index;

  ExerciseCard(
      {required this.exercise,
      required this.onDelete,
      required this.onEdit,
      this.index,
      required this.onAddSet});

  @override
  State<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  @override
  void initState() {
    // TODO: implement initState
    final add = Provider.of<AddExerciseProvider>(context, listen: false);
    add.exercise = widget.exercise;

    widget.exercise.sets =  widget.exercise.sets ?? [SetData(kgController: TextEditingController(), repsController: TextEditingController())];;
    add.exercise!.sets = widget.exercise.sets ?? [
      SetData(
          kgController: TextEditingController(),
          repsController: TextEditingController())
    ];
    add.notifyListeners();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, AddExerciseProvider>(
        builder: (context, home, add, child) {
      return Card(
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.exercise.name!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: widget.onEdit,
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: widget.onDelete,
                      ),
                    ],
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.exercise.sets!.length,
                itemBuilder: (context, index) {
                  final set = widget.exercise.sets![index];
                  return Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: set.kgController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: appColor(context).darkText)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: appColor(context).darkText)),
                                suffixIcon: Text(
                                  'Kg',
                                  style: appCss.dmSansLight12
                                      .textColor(appColor(context).darkText),
                                ).paddingSymmetric(vertical: Sizes.s20)),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: set.repsController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: appColor(context).darkText)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: appColor(context).darkText)),
                                suffixIcon: Text(
                                  'reps',
                                  style: appCss.dmSansLight12
                                      .textColor(appColor(context).darkText),
                                ).paddingSymmetric(vertical: Sizes.s20)),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      Icon(Icons.remove_circle).inkWell(onTap: () {
                        /* widget.onAddSet(index);
                            widget.exercise.sets!.removeAt(index);
                            home.newAddList[widget.index!]!.sets!.removeAt(index);
                            home.notifyListeners();*/
                        /*          add.exercise!.sets!.removeAt(index);
                            add.notifyListeners();*/
                        setState(() {});
                      })
                    ],
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  final newSet = SetData(
                    kgController: TextEditingController(),
                    repsController: TextEditingController(),
                  );
                  widget.onAddSet(newSet);

                  setState(() {});
                },
                child: Text('Add Set'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
