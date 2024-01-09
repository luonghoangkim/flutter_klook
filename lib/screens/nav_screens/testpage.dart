import 'package:apptest/controller/totoListController.dart';
import 'package:apptest/model/todoModel.dart';
import 'package:apptest/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key});

  final TodoController todoController = Get.put(TodoController());

  final TextEditingController titleController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  Future<void> showTodoDialog(BuildContext context, {TodoModel? todo}) async {
    titleController.text = todo?.title ?? '';
    nameController.text = todo?.name ?? '';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(todo == null ? 'Add Todo' : 'Update Todo'),
          content: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ],
          ),
          actions: [
            CustomButton(
                buttonText: 'Thoát',
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            CustomButton(
                buttonText: todo == null ? 'Thêm' : 'Cập nhật',
                onPressed: () {
                  if (todo == null) {
                    todoController.addTodo(TodoModel(
                      title: titleController.text,
                      name: nameController.text,
                    ));
                  } else {
                    todoController.updateTodo(todo.copyWith(
                      title: titleController.text,
                      name: nameController.text,
                    ));
                  }
                  Navigator.of(context).pop();
                }),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () async {
                  await showTodoDialog(context);
                },
                child: Icon(Icons.add)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () {
                if (todoController.isLoading.value) {
                  return ShimmerLoadingList();
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: todoController.TodoList.length,
                    itemBuilder: (context, index) {
                      var todo = todoController.TodoList[index];
                      return Container(
                        margin: const EdgeInsets.all(10),
                        color: Colors.grey[400],
                        child: ListTile(
                          title: Text(todo.title.toString()),
                          subtitle: Text(todo.name.toString()),
                          leading: InkWell(
                            onTap: () async {
                              await showTodoDialog(context, todo: todo);
                            },
                            child: const Icon(Icons.edit),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              todoController.deleteTodo(todo);
                            },
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerLoadingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 15,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListTile(
            title: Container(
              height: 20,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            subtitle: Container(
              height: 16,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        );
      },
    );
  }
}
