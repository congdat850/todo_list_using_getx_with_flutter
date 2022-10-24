import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_list_using_getx_with_flutter/models/Todo.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  @override
  void onInit() {
    List? storedTodos = GetStorage().read<List>('todos');

    if (!(storedTodos == null)) {
      todos = storedTodos.map((e) => Todo.fromJson(e)).toList().obs;
    }
    ever(todos, (_) {
      GetStorage().write('todos', todos.toList());
    });
    super.onInit();
  }
}
