import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/data/models/todo_model.dart';
import 'package:flutter_provider_ex/widgets/add_new_task_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Example"),
      ),
      body: Container(
        child: Consumer<TodoModel>(
          builder: (BuildContext context, todoModel, Widget? child) {
            var list = todoModel.tasksList;
            return ListView.builder(
              itemBuilder: (ctx, index) => Card(
                child: ListTile(
                  onLongPress: () => todoModel.removeTask(index),
                  title: Text(list[index].title),
                  subtitle: Text(list[index].detail),
                  trailing: !list[index].isImportant
                      ? Icon(Icons.star_border)
                      : Icon(Icons.star),
                ),
              ),
              itemCount: list.length,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (ctx) => AddNewTask(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
