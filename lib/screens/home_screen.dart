import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/todos_model.dart';
import 'package:flutter_application_1/widgets/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoModel> todos = [];
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Todo List')),
      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Todo(
                  title: todos[index].title,
                  desc: todos[index].desc,
                  check: todos[index].check,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: title,
              decoration: const InputDecoration(labelText: "Title"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: desc,
              decoration: const InputDecoration(labelText: "Desc"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (title.text.isNotEmpty && desc.text.isNotEmpty) {
                todos.add(TodoModel(title.text, desc.text, false));
                setState(() {});
              }
            },
            child: Text('Add Todo'),
          ),
        ],
      ),
    );
  }
}
