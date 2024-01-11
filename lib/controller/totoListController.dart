import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apptest/model/todoModel.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  var TodoList = RxList<TodoModel>();
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getTodos();
  }

  Future<void> getTodos() async {
    try {
      final response = await http.get(Uri.parse(
          'https://659cb628633f9aee7907d8d7.mockapi.io/api/TodoList'));
      var data = jsonDecode(response.body.toString());

      if (response.statusCode == 200) {
        TodoList.clear();
        for (Map<String, dynamic> index in data) {
          TodoList.add(TodoModel.fromJson(index));
        }
      }
    } catch (error) {
      print('Error: $error');
    } finally {
      isLoading(false);
    }
  }

  Future<void> addTodo(TodoModel newTodo) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse('https://659cb628633f9aee7907d8d7.mockapi.io/api/TodoList'),
        body: jsonEncode(newTodo.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        getTodos();
      }
    } catch (error) {
      print('Error adding todo: $error');
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateTodo(TodoModel updatedTodo) async {
    try {
      isLoading(true);
      final response = await http.put(
        Uri.parse(
            'https://659cb628633f9aee7907d8d7.mockapi.io/api/TodoList/${updatedTodo.id}'),
        body: jsonEncode(updatedTodo.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // If the todo was updated successfully, refresh the todo list
        getTodos();
      }
    } catch (error) {
      print('Error updating todo: $error');
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteTodo(TodoModel todo) async {
    try {
      isLoading(true);
      final response = await http.delete(
        Uri.parse(
            'https://659cb628633f9aee7907d8d7.mockapi.io/api/TodoList/${todo.id}'),
      );

      if (response.statusCode == 200) {
        // If the todo was deleted successfully, refresh the todo list
        getTodos();
      }
    } catch (error) {
      print('Error deleting todo: $error');
    } finally {
      isLoading(false);
    }
  }
}
