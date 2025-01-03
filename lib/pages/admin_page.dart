import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/dashboard_stats.dart';
import '../services/auth_service.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  Timer? _refreshTimer;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _refreshTimer = Timer.periodic(const Duration(minutes: 5), (timer) {
      _refreshData();
    });
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  Future<void> _refreshData() async {
    setState(() {
      // Refresh your data here
    });
  }

  void _updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  Widget _buildSelectedView() {
    switch (_selectedIndex) {
      case 0:
        return const DashboardStats();
      case 1:
        return _buildTimetableManagement();
      case 2:
        return _buildNotifications();
      case 3:
        return _buildAccountCreation();
      default:
        return const DashboardStats();
    }
  }

  Widget _buildTimetableManagement() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // Logic to add/update timetable
            },
            child: const Text('Add/Update Timetable'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Logic to view timetable
            },
            child: const Text('View Timetables'),
          ),
        ],
      ),
    );
  }

  Widget _buildNotifications() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // Logic to send notifications
            },
            child: const Text('Send New Notification'),
          ),
          const SizedBox(height: 16),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Recent Notifications',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  // Add your notification history here
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountCreation() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // Logic for student account creation
            },
            child: const Text('Create Student Account'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Logic for lecturer account creation
            },
            child: const Text('Create Lecturer Account'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshData,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => AuthService.logout(context),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Admin Controls',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              selected: _selectedIndex == 0,
              onTap: () => _updateIndex(0),
            ),
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text('Manage Timetables'),
              selected: _selectedIndex == 1,
              onTap: () => _updateIndex(1),
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Send Notifications'),
              selected: _selectedIndex == 2,
              onTap: () => _updateIndex(2),
            ),
            ListTile(
              leading: const Icon(Icons.person_add),
              title: const Text('Account Creation'),
              selected: _selectedIndex == 3,
              onTap: () => _updateIndex(3),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildSelectedView(),
          ),
        ),
      ),
    );
  }
}
