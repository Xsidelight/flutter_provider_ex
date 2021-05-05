import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/data/models/todo_model.dart';
import 'package:provider/provider.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({Key? key}) : super(key: key);

  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  var isImportant = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 400,
        padding: EdgeInsets.only(right: 15, top: 10, left: 15),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: "Please enter title"),
            ),
            TextField(
              controller: _detailController,
              decoration: InputDecoration(hintText: "Please enter details"),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Important'),
                Checkbox(
                  value: isImportant,
                  onChanged: (value) {
                    setState(() {
                      isImportant = value!;
                    });
                  },
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () => Provider.of<TodoModel>(context, listen: false).addTask(
                  _titleController.text, _detailController.text, isImportant),
              child: Text('Add Task'),
            )
          ],
        ),
      ),
    );
  }
}
