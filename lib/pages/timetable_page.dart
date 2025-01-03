import 'package:flutter/material.dart';

class TimetablePage extends StatefulWidget {
  final String userRole;
  const TimetablePage({Key? key, required this.userRole}) : super(key: key);

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTimetable();
  }

  Future<void> _loadTimetable() async {
    // TODO: Implement API call to fetch timetable
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timetable'),
        actions: [
          if (widget.userRole == 'admin' || widget.userRole == 'lecturer')
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // TODO: Implement add/edit timetable
              },
            ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: _buildTimetableGrid(),
              ),
            ),
    );
  }

  Widget _buildTimetableGrid() {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Time')),
        DataColumn(label: Text('Monday')),
        DataColumn(label: Text('Tuesday')),
        DataColumn(label: Text('Wednesday')),
        DataColumn(label: Text('Thursday')),
        DataColumn(label: Text('Friday')),
      ],
      rows: _buildTimeSlotRows(),
    );
  }

  List<DataRow> _buildTimeSlotRows() {
    // TODO: Implement time slot rows
    return [];
  }
}
