import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskManagementScreen extends StatefulWidget {
  @override
  _TaskManagementScreenState createState() => _TaskManagementScreenState();
}

class _TaskManagementScreenState extends State<TaskManagementScreen> {
  List<Task> tasks = [
    Task(name: 'Task 1', dateTime: 'Thu, Jul 1, 2023', priority: 'High'),
    Task(name: 'Task 2', dateTime: 'Fri, Jul 2, 2023', priority: 'Low'),
    Task(name: 'Task 3', dateTime: 'Sat, Jul 3, 2023', priority: 'Medium'),
    Task(name: 'Task 4', dateTime: 'Sun, Jul 4, 2023', priority: 'High'),
    Task(name: 'Task 5', dateTime: 'Mon, Jul 5, 2023', priority: 'Low'),
  ];

  int getCompletedTasksCount() {
    return tasks.where((task) => task.isCompleted).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My tasks',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${tasks.length} tasks, ${getCompletedTasksCount()} completed',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return tasks[index].isCompleted
                    ? Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      tasks[index].name,
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                    subtitle: Text('${tasks[index].dateTime} * ${tasks[index].priority}'),
                    trailing: Checkbox(
                      value: tasks[index].isCompleted,
                      onChanged: (value) {
                        setState(() {
                          tasks[index].isCompleted = value!;
                        });
                      },
                    ),
                  ),
                )
                    : ListTile(
                  title: Text(
                    tasks[index].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('${tasks[index].dateTime} * ${tasks[index].priority}'),
                  trailing: Checkbox(
                    value: tasks[index].isCompleted,
                    onChanged: (value) {
                      setState(() {
                        tasks[index].isCompleted = value!;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTaskDialog(context);
        },
        backgroundColor: Colors.deepOrange,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void _addTaskDialog(BuildContext context) {
    String taskName = '';
    String taskDateTime = '';
    String taskPriority = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Task'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Task Name'),
                  onChanged: (value) {
                    taskName = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Task Date & Time'),
                  onChanged: (value) {
                    taskDateTime = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Task Priority'),
                  onChanged: (value) {
                    taskPriority = value;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (taskName.isNotEmpty && taskDateTime.isNotEmpty && taskPriority.isNotEmpty) {
                  setState(() {
                    tasks.add(Task(name: taskName, dateTime: taskDateTime, priority: taskPriority));
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}