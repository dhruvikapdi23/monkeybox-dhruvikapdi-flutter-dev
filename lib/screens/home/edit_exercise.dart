import 'package:monkeybox_dhruvi/model/exercise_model.dart';

import '../../config.dart';

class EditExercise extends StatefulWidget {
  final Data? exercise;
  final Function(SetData) onAddSet;
  EditExercise({this.exercise, required this.onAddSet});

  @override
  _EditExerciseState createState() => _EditExerciseState();
}

class _EditExerciseState extends State<EditExercise> {
  late TextEditingController _nameController;
  late List<SetData> _sets;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.exercise?.name ?? '');
    _sets = widget.exercise?.sets ?? [SetData(kgController: TextEditingController(), repsController: TextEditingController())];
    setState(() {

    });
  }

  void _addNewSet({String? kg, String? reps}) {
    final newSet = SetData(
      kgController: TextEditingController(text: kg),
      repsController: TextEditingController(text: reps),
    );

    setState(() {
      _sets.add(newSet);
    });
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

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
                          controller: set.kgController,
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
              onPressed: () => _addNewSet(),
              child: Text('Add Set'),
            ),
          ],
        ),
      ),
    );
  }
}