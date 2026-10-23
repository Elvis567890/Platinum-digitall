
import 'package:flutter/material.dart';

void main() => runApp(const PlatinumStaffApp());

const navy = Color(0xFF0A2540);
const gold = Color(0xFFD4AF37);

class PlatinumStaffApp extends StatelessWidget {
  const PlatinumStaffApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Platinum Staff',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: navy),
        appBarTheme: const AppBarTheme(
          backgroundColor: navy,
          foregroundColor: Colors.white,
        ),
      ),
      home: const StaffDashboard(),
    );
  }
}

class StaffDashboard extends StatelessWidget {
  const StaffDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <({String title, String subtitle, IconData icon})>[
      (
        title: 'Announcements',
        subtitle: 'Prepare and publish school notices',
        icon: Icons.campaign_outlined,
      ),
      (
        title: 'Student Pulse',
        subtitle: 'Moderate student community content',
        icon: Icons.forum_outlined,
      ),
      (
        title: 'Live Lessons',
        subtitle: 'Manage lesson links and replays',
        icon: Icons.video_camera_front_outlined,
      ),
      (
        title: 'Clubs',
        subtitle: 'Assign leaders and manage club updates',
        icon: Icons.groups_outlined,
      ),
      (
        title: 'Results',
        subtitle: 'Academic records management',
        icon: Icons.assessment_outlined,
      ),
      (
        title: 'Suggestions',
        subtitle: 'Review anonymous suggestions',
        icon: Icons.lightbulb_outline,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Platinum Staff'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: navy,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.school, color: gold, size: 40),
                SizedBox(height: 14),
                Text(
                  'PLATINUM SECONDARY SCHOOL',
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(height: 8),
                Text(
                  'Staff Workspace',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Excellence Is Our Culture.',
                  style: TextStyle(color: gold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Management tools',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ...items.map(
            (item) => Card(
              elevation: 0,
              child: ListTile(
                leading: Icon(item.icon, color: navy),
                title: Text(
                  item.title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(item.subtitle),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${item.title}: backend integration is required.',
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Card(
            child: ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text('Access protection'),
              subtitle: Text(
                'Connect staff sign-in and server-enforced roles '
                'before handling student records.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
