import 'package:flutter/cupertino.dart';
import 'package:monkeybox_dhruvi/common/extension/text_style_extensions.dart';
import 'package:monkeybox_dhruvi/providers/home_provider.dart';
import 'package:provider/provider.dart';

import '../../config.dart';

class AddExerciseDialog extends StatelessWidget {
  final int? index;
  const AddExerciseDialog({super.key,  this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, home, child) {
      return CupertinoAlertDialog(
          title: Text(
            appFonts.workoutName,
            style: const TextStyle(fontSize: 18),
          ),
          content: Column(
            children: [
              Text(
                appFonts.enterNameForWorkout,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              const VSpace(Sizes.s20),
              CupertinoTextField(
                controller: home.controller,
                style: appCss.dmSansMedium16.textColor(Colors.blue),
                decoration: BoxDecoration(
                    color: appColor(context).darkText,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: const Color(0xff434143))),
              ),
            ],
          ),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              /// This parameter indicates this action is the default,
              /// and turns the action's text to bold text.
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                appFonts.cancel,
                style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            ),
            CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  home.showModalSheet(context,index: index);
                },
                child: Text(
                  appFonts.save,
                  style: const TextStyle(color: Colors.blue, fontSize: 18),
                ))
          ]);
    });
  }
}
