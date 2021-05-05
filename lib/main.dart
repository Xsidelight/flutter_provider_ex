import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/data/models/todo_model.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: TodoModel(),
      child: MaterialApp(
        title: "Provider Example",
        home: HomeScreen(),
      ),
    );
  }
}
