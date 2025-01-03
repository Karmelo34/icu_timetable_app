import 'package:flutter/material.dart';

class ClassManagementPage extends StatefulWidget {
  const ClassManagementPage({Key? key}) : super(key: key);

  @override
  State<ClassManagementPage> createState() => _ClassManagementPageState();
}

class _ClassManagementPageState extends State<ClassManagementPage> {
  final List<Map<String, dynamic>> _classes = [
    {
      'name': 'Introduction to Programming',
      'code': 'CS101',
      'students': 45,
      'time': 'Monday 9:00 AM',
    },
    // Add more mock classes
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _addClass,
            child: const Text('Add New Class'),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _classes.length,
              itemBuilder: (context, index) {
                final classData = _classes[index];
                return Card(
                  child: ListTile(
                    title: Text(classData['name']),
                    subtitle:
                        Text('${classData['code']} - ${classData['time']}'),
                    trailing: Text('${classData['students']} students'),
                    onTap: () => _manageClass(classData),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _addClass() {
    // Implement add class dialog
  }

  void _manageClass(Map<String, dynamic> classData) {
    // Implement class management dialog
  }
}
