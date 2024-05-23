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
import 'package:monkeybox_dhruvi/screens/home/add_exercise_dialog.dart';
import 'package:monkeybox_dhruvi/screens/home/equipment_muscles.dart';
import 'package:monkeybox_dhruvi/screens/home/exercise_list_dialog.dart';
import 'package:monkeybox_dhruvi/screens/home/filter_muscles.dart';
import 'package:monkeybox_dhruvi/widgets/button_common.dart';
import 'package:provider/provider.dart';

import '../config.dart';

class HomeProvider extends ChangeNotifier {
  List exerciseList = [];
  List<Data> newAddList = [];
  List saveDataList = [];final List<Exercise> sets = [];

  List<TextEditingController> controllersList = [];
  List<Row> textFieldRows = [];


  List<Data> exerciseModelList = [];
  List<Data> searchList = [];
  double susItemHeight = 40;
  List<MainMuscles> muscleGroup = [], filterMuscleList = [];
  List<Equipments> equipments = [], filterEquipment = [];
  TextEditingController controller = TextEditingController();
  TextEditingController search = TextEditingController();

  onInit() {
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
  }

  addExericeDialog(context) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) =>
            Theme(data: ThemeData.dark(), child: const AddExerciseDialog()));
  }

  showModalSheet(context) {
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
                  showExerciseModalSheet(context);
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


  showExerciseModalSheet(context) {
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
                Text(appFonts.cancel).inkWell(onTap: () => route.pop(context)),
            trailing:
                Text(appFonts.add).inkWell(onTap: () => addDetailSheet(context)),
                    ),
                    child: const ExerciseListDialog(),
                  ),
          )),
    );
  }

  addDetailSheet(context) {
/*    controllersList = [];
    textFieldRows = [];
    notifyListeners();
    addNewTextFieldPair(context);*/
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Material(
          child: Scaffold(
            body:
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ListView(
                  children: newAddList.asMap().entries.map((e) => ExerciseCard( exercise: e.value, onDelete: () {  },)).toList(),
                ),

              ],
            ),

          )),
    );
  }

  void saveData(context) {
    final home = Provider.of<HomeProvider>(context,listen: false);


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


class Exercise {
  final Data data;
  final List<Set> sets;

  Exercise({required this.data, required this.sets});
}


class ExerciseCard extends StatefulWidget {
  final Data exercise;
  final VoidCallback onDelete;

  ExerciseCard({required this.exercise, required this.onDelete});

  @override
  State<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {


   _saveExercise(context) {
     final home = Provider.of<HomeProvider>(context,listen: false);
    final exercise = Exercise(
      data: widget.exercise,
      sets: widget.exercise.sets!,
    );

     home.sets.add(exercise);
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {

    return Consumer<HomeProvider>(
      builder: (context,home,child) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.exercise.name!,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),

                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: widget.onDelete,
                    ),

                  ],
                ),
                if(widget.exercise.sets != null)
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
                              controller: set.kgsController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                suffixIcon: Text("Kgs").paddingSymmetric(vertical: 15),
                                enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: appColor(context).stroke)),
                                disabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: appColor(context).stroke)),
                                focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: appColor(context).stroke)),
                                border: OutlineInputBorder(borderSide: BorderSide(color: appColor(context).stroke)),
                                labelText: 'Enter text',

                              ),
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
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                suffixIcon: Text("Kgs").paddingSymmetric(vertical: 15),
                                enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: appColor(context).stroke)),
                                disabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: appColor(context).stroke)),
                                focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: appColor(context).stroke)),
                                border: OutlineInputBorder(borderSide: BorderSide(color: appColor(context).stroke)),

                                labelText: 'reps',
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.remove_circle),
                          onPressed: () {
                            widget.exercise.sets!.removeAt(index);
                          },
                        ),
                      ],
                    );
                  },
                ),
                TextButton(
                  onPressed: () {
                    final set = Set(
                      kgsController: TextEditingController(),
                      repsController: TextEditingController(),
                    );
                    if(widget.exercise.sets != null) {
                      widget.exercise.sets!.add(set);
                    }else{
                      widget.exercise.sets = [set];
                    }
                    setState(() {

                    });
                  },
                  child: Text('Add set'),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

/*
class AddExercisePage extends StatefulWidget {
  @override
  _AddExercisePageState createState() => _AddExercisePageState();
}

class _AddExercisePageState extends State<AddExercisePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final List<Set> _sets = [];

  @override
  void initState() {
    super.initState();
    _addNewSet();
  }

  void _addNewSet({String? kgs, String? reps}) {
    final set = Set(
      kgsController: TextEditingController(text: kgs),
      repsController: TextEditingController(text: reps),
    );

    setState(() {
      _sets.add(set);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _typeController.dispose();
    _sets.forEach((set) {
      set.kgsController.dispose();
      set.repsController.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Exercise'),
        actions: [
          TextButton(
            onPressed: _saveExercise,
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextButton(
                onPressed: _saveExercise,
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Exercise Name',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _typeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Type',
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _sets.length,
                itemBuilder: (context, index) {
                  final set = _sets[index];
                  return Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: set.kgsController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'kg',
                            ),
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
                              border: OutlineInputBorder(),
                              labelText: 'reps',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.remove_circle),
                        onPressed: () {
                          setState(() {
                            _sets.removeAt(index);
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
              TextButton(
                onPressed: _addNewSet,
                child: Text('Add set'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

class DynamicTextFields extends StatefulWidget {
  @override
  _DynamicTextFieldsState createState() => _DynamicTextFieldsState();
}

class _DynamicTextFieldsState extends State<DynamicTextFields> {
  List<TextEditingController> _controllers = [];
  List<Row> _textFieldRows = [];
  List<String> _savedData = [];

  @override
  void initState() {
    super.initState();
    _addNewTextFieldPair();
  }

  void _addNewTextFieldPair({String? text1, String? text2}) {
    final controller1 = TextEditingController(text: text1);
    final controller2 = TextEditingController(text: text2);

    final textFieldRow = Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller1,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                suffixIcon: Text("Kgs").paddingSymmetric(vertical: 15),
                enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: appColor(context).stroke)),
                disabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: appColor(context).stroke)),
                focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: appColor(context).stroke)),
                border: OutlineInputBorder(borderSide: BorderSide(color: appColor(context).stroke)),
                labelText: 'Enter text',
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller2,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                suffixIcon: Text("Kgs").paddingSymmetric(vertical: 15),
                enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: appColor(context).stroke)),
                disabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: appColor(context).stroke)),
                focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: appColor(context).stroke)),
                border: OutlineInputBorder(borderSide: BorderSide(color: appColor(context).stroke)),
                labelText: 'Enter text',
              ),
            ),
          ),
        ),
        /*IconButton(
          icon: ,
          onPressed: () {

          },
        )*/
        InkWell(
          onTap: (){
            _removeTextFieldPair(controller1, controller2);
          },
            child: Icon(Icons.remove_circle)),
      ],
    );

    setState(() {
      _controllers.addAll([controller1, controller2]);
      _textFieldRows.add(textFieldRow);
    });
  }

  void _removeTextFieldPair(TextEditingController controller1, TextEditingController controller2) {
    setState(() {
      int index = _controllers.indexOf(controller1);
      if (index != -1) {
        _controllers.removeAt(index);
        _controllers.removeAt(index); // Remove both controllers (they are consecutive)
        _textFieldRows.removeAt(index ~/ 2); // Each pair of controllers represents one row
      }
      controller1.dispose();
      controller2.dispose();
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _saveData() {
    _savedData.clear();
    for (var controller in _controllers) {
      _savedData.add(controller.text);
    }
    print('Saved Data: $_savedData');
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<HomeProvider>(
      builder: (context,home,child) {
        return CupertinoPageScaffold(
          backgroundColor: const Color(0xFFFFFFFF),
          navigationBar: CupertinoNavigationBar(
            backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
            middle: Text(home.controller.text,
                style: appCss.dmSansSemiBold18
                    .textColor(appColor(context).darkText)),
            leading:
            Text(appFonts.cancel).inkWell(onTap: () => route.pop(context)),
            trailing: Text(appFonts.save).inkWell(onTap: () =>_savedData),
          ),
          child: Stack(
            children: [
              ListView(
                children: [
                  const VSpace(Sizes.s80),
                  Text(home.controller.text,style: appCss.dmSansMedium16.textColor(appColor(context).darkText),).padding(horizontal: Sizes.s20),
                  const VSpace(Sizes.s2),
                  Text("${home.newAddList.length} exercises ${_controllers.length} set",style: appCss.dmSansLight14.textColor(appColor(context).darkText),).padding(horizontal: Sizes.s20),

                  ...home.newAddList.asMap().entries.map((e) => Container(
                    margin: EdgeInsets.symmetric(horizontal: Sizes.s20),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: ShapeDecoration(
                        color: appColor(context).whiteColor,
                        shadows: [
                          const BoxShadow(
                              color: Color(0xFFF5F5F5), blurRadius: 12)
                        ],
                        shape: SmoothRectangleBorder(
                            borderRadius: SmoothBorderRadius(
                                cornerRadius: 8, cornerSmoothing: 1))),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            e.value.headerImage != null
                                ? Container(
                              height: Sizes.s40,
                              width: Sizes.s40,
                              decoration: ShapeDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          e.value.headerImage!)),
                                  shape: SmoothRectangleBorder(
                                      borderRadius: SmoothBorderRadius(
                                          cornerRadius: 8,
                                          cornerSmoothing: 1))),
                            )
                                : Container(
                              height: Sizes.s40,
                              width: Sizes.s40,
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                  shape: SmoothRectangleBorder(
                                      borderRadius: SmoothBorderRadius(
                                          cornerRadius: 8,
                                          cornerSmoothing: 1))),
                              child: Text(e.value.name![0]),
                            ),
                            const HSpace(Sizes.s10),
                            Text(e.value.name!)
                          ],
                        ).paddingSymmetric(horizontal: Sizes.s12),
                        Divider(),
                        ..._textFieldRows,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: _addNewTextFieldPair,
                            child: Text('Add Text Field Pair'),
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),


            ],
          ),
        );
      }
    );
  }
}

