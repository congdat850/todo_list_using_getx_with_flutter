import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:todo_list_using_getx_with_flutter/controllers/TodoController.dart';
import 'package:todo_list_using_getx_with_flutter/models/Todo.dart';

class TodoScreen extends StatelessWidget {
  final TodoController todoController = Get.find();
  final int index;

  TodoScreen({this.index = -1});

  @override
  Widget build(BuildContext context) {
    String text = '';
    if (!(this.index == -1)) {
      text = todoController.todos[index].text;
    }
    TextEditingController textEditingController =
        TextEditingController(text: text);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'What do you want to accomplish?',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none),
                style: TextStyle(
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 999,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text('Cancel'),
                  // color: Colors.red,
                   style: TextButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    Get.back();
                  },
                ),
                TextButton(
                  child: Text((this.index == -1) ? 'Add' : 'Edit'),
                  // color: Colors.green,
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    if (this.index == -1) {
                      todoController.todos
                          .add(Todo(text: textEditingController.text));
                    } else {
                      var editing = todoController.todos[index];
                      editing.text = textEditingController.text;
                      todoController.todos[index] = editing;
                    }

                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
