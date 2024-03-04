import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/task.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  TextEditingController searchController = TextEditingController();
  List<Task> tasks = [];
  @override
  void initState() {
    super.initState();
    // Create fake data
    tasks = [
      Task(name: 'Task 1', createdAt: DateTime(2023, 7, 20, 9, 0), status: 'Pending'),
      Task(name: 'Task 2', createdAt: DateTime.now(), status: 'Completed'),
      Task(name: 'Task 3', createdAt: DateTime.now(), status: 'Pending'),
    ];
  }

  List<Task> filteredTasks(String query) {
    return tasks.where((task) => task.name.toLowerCase().contains(query.toLowerCase())).toList();
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return Colors.orange;
      case 'Completed':
        return Colors.green;
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: const InputDecoration(
                hintText: 'Search tasks...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: filteredTasks(searchController.text).length,
                itemBuilder: (context, index) {
                  Task task = filteredTasks(searchController.text)[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateFormat('MMMM d, yyyy, h:mm a').format(task.createdAt),
                              style: TextStyle(color: Colors.grey,fontSize: 13),
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IntrinsicWidth(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: getStatusColor(task.status),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  task.status,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward_ios_rounded),
                              onPressed: () {
                                // Xử lý khi nhấn vào button detail
                              },
                            ),
                          ],
                        ),
                      ),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                        child:  Divider(height: 1, color: Colors.grey),
                      )

                    ],
                  );
                },
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
