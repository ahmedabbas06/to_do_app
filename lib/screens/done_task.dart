import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../widgets/task_card.dart';
import '../controller/theme_controller.dart';

class DoneTasks extends StatefulWidget {
  final ThemeController theme;

  const DoneTasks({
    super.key,
    required this.theme,
  });

  @override
  State<DoneTasks> createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {
  var doneTask = Hive.box("done_task");
  var task = Hive.box("my_task");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

        title: Text(
          'Done Tasks',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),

        child: ListView.builder(
          itemCount: doneTask.length,

          itemBuilder: (BuildContext context, int index) {
            return TaskCard(
              title: doneTask.getAt(index)['title'],
              description: doneTask.getAt(index)['description'],
              isCompleted: doneTask.getAt(index)['isCompleted'] == true,
              showEdit: false,

              onChanged: (value) {
                setState(() {
                  doneTask.getAt(index)['isCompleted'] = value!;
                  task.add(doneTask.getAt(index));
                  doneTask.deleteAt(index);
                });
              },

              onDelete: () {
                doneTask.deleteAt(index);
                setState(() {});
              },
            );
          },
        ),
      ),
    );
  }
}