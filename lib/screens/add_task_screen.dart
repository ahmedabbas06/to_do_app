import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../widgets/Text_field_Widgets.dart';

class AddTask extends StatefulWidget {
  final int? index;

  const AddTask({
    super.key,
    this.index,
  });

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var box = Hive.box("my_task");
  final formKey = GlobalKey<FormState>();
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();

    if (widget.index != null) {
      var task = box.getAt(widget.index!);

      titleController.text = task["title"];
      descriptionController.text = task["description"];
      isCompleted = task["isCompleted"] == true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.index == null ? "Add Task" : "Edit Task",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 24,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    widget.index == null
                        ? 'Create a new task'
                        : 'Edit your task',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Add the details below and stay organized.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurfaceVariant,
                    ),
                  ),

                  SizedBox(height: 32),

                  Text(
                    'Task Title',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),

                  SizedBox(height: 8),

                  TextfieldWidgets(
                    controller: titleController,
                    vali: 'Please enter a title',
                    hint: 'Enter task title',
                  ),

                  SizedBox(height: 24),

                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),

                  SizedBox(height: 8),

                  TextfieldWidgets(
                    controller: descriptionController,
                    vali: 'Please enter a description',
                    hint: 'Enter task description',
                  ),

                  SizedBox(height: 32),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {

                          var taskData = {
                            "title": titleController.text,
                            "description": descriptionController.text,
                            "isCompleted": isCompleted,
                          };

                          if (widget.index == null) {
                            box.add(taskData);
                          } else {
                            box.putAt(widget.index!, taskData);
                          }

                          titleController.clear();
                          descriptionController.clear();

                          Navigator.pop(context);
                        }
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        foregroundColor: Colors.white,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            widget.index == null
                                ? Icons.add_task
                                : Icons.save_outlined,
                          ),

                          SizedBox(width: 10),

                          Text(
                            widget.index == null
                                ? 'Add Task'
                                : 'Save Editing',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}