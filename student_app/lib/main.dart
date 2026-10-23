
import 'package:flutter/material.dart';

void main() {
  runApp(const PlatinumApp());
}

const navy = Color(0xFF0A2540);
const gold = Color(0xFFD4AF37);
const background = Color(0xFFF4F6FA);

class PlatinumApp extends StatelessWidget {
  const PlatinumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Platinum Digital',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(seedColor: navy),
        appBarTheme: const AppBarTheme(
          backgroundColor: navy,
          foregroundColor: Colors.white,
        ),
      ),
      home: const StudentHome(),
    );
  }
}

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  int selectedIndex = 0;

  final pages = const [
    DashboardPage(),
    PulsePage(),
    AnnouncementsPage(),
    ClubsPage(),
    StudentServicesPage(),
  ];

  final titles = const [
    'Platinum Star Hub',
    'Platinum Pulse',
    'Announcements',
    'School Clubs',
    'Student Services',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[selectedIndex]),
        actions: [
          IconButton(
            tooltip: 'Messages',
            icon: const Icon(Icons.chat_bubble_outline),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const MessagesPage(),
              ),
            ),
          ),
          IconButton(
            tooltip: 'Suggestions',
            icon: const Icon(Icons.lightbulb_outline),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const SuggestionPage(),
              ),
            ),
          ),
        ],
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.play_circle_outline),
            label: 'Pulse',
          ),
          NavigationDestination(
            icon: Icon(Icons.campaign_outlined),
            label: 'News',
          ),
          NavigationDestination(
            icon: Icon(Icons.groups_outlined),
            label: 'Clubs',
          ),
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            label: 'Services',
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: navy,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.school, color: gold, size: 42),
              const SizedBox(height: 14),
              const Text(
                'PLATINUM SECONDARY SCHOOL',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Welcome to your Star Hub',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Excellence Is Our Culture.',
                style: TextStyle(color: gold, fontSize: 15),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        const SectionTitle('Your school at a glance'),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.25,
          children: const [
            HubCard(
              icon: Icons.campaign,
              title: 'Announcements',
              subtitle: 'School updates',
            ),
            HubCard(
              icon: Icons.play_circle_fill,
              title: 'Platinum Pulse',
              subtitle: 'Student community',
            ),
            HubCard(
              icon: Icons.video_camera_front,
              title: 'Live lessons',
              subtitle: 'Online classroom',
            ),
            HubCard(
              icon: Icons.menu_book,
              title: 'Results',
              subtitle: 'Academic records',
            ),
            HubCard(
              icon: Icons.groups,
              title: 'Clubs',
              subtitle: 'Find your community',
            ),
            HubCard(
              icon: Icons.forum,
              title: 'Messages',
              subtitle: 'Private conversations',
            ),
          ],
        ),
        const SizedBox(height: 20),
        const SectionTitle('Coming soon'),
        const SizedBox(height: 8),
        const ComingSoonCard(
          title: 'School fees',
          subtitle: 'Fees information and payment services',
        ),
        const ComingSoonCard(
          title: 'Homework money',
          subtitle: 'Homework-related payment information',
        ),
      ],
    );
  }
}

class HubCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const HubCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: navy, size: 28),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: navy,
      ),
    );
  }
}

class ComingSoonCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const ComingSoonCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        leading: const Icon(Icons.lock_clock, color: gold),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Text(
          'Coming Soon',
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class PulsePage extends StatefulWidget {
  const PulsePage({super.key});

  @override
  State<PulsePage> createState() => _PulsePageState();
}

class _PulsePageState extends State<PulsePage> {
  final controller = TextEditingController();
  final posts = <String>[];
  final liked = <int>{};

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void addPost() {
    final message = controller.text.trim();
    if (message.isEmpty) return;

    setState(() {
      posts.insert(0, message);
      controller.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Demo post added on this device. Backend publishing is not connected.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionTitle('Platinum Pulse'),
        const SizedBox(height: 6),
        const Text('Share ideas and positive school moments.'),
        const SizedBox(height: 16),
        TextField(
          controller: controller,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'What would you like to share?',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: FilledButton.icon(
            onPressed: addPost,
            icon: const Icon(Icons.send),
            label: const Text('Post'),
          ),
        ),
        const Divider(height: 28),
        if (posts.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text('No demo posts yet. Be the first to share.'),
            ),
          ),
        ...List.generate(posts.length, (index) {
          return Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.person_outline),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Demo student',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(posts[index]),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (!liked.add(index)) liked.remove(index);
                          });
                        },
                        icon: Icon(
                          liked.contains(index)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: liked.contains(index) ? Colors.red : null,
                        ),
                      ),
                      const Text('Like'),
                      const Spacer(),
                      IconButton(
                        onPressed: () => ScaffoldMessenger.of(context)
                            .showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Comments require backend integration.',
                            ),
                          ),
                        ),
                        icon: const Icon(Icons.comment_outlined),
                      ),
                      const Text('Comment'),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        SectionTitle('School announcements'),
        SizedBox(height: 8),
        Text(
          'Official updates should appear here after the school connects '
          'its announcement database.',
        ),
        SizedBox(height: 20),
        Card(
          child: ListTile(
            leading: Icon(Icons.event_note, color: navy),
            title: Text('No published announcements'),
            subtitle: Text('School notices will appear here.'),
          ),
        ),
      ],
    );
  }
}

class ClubsPage extends StatelessWidget {
  const ClubsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const clubs = [
      ('Science Club', Icons.science),
      ('Debate Club', Icons.record_voice_over),
      ('Environmental Club', Icons.eco),
      ('ICT Club', Icons.computer),
      ('Sports Club', Icons.sports),
      ('Music and Drama Club', Icons.music_note),
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionTitle('Discover school clubs'),
        const SizedBox(height: 8),
        const Text(
          'Join activities, follow club updates and connect with members.',
        ),
        const SizedBox(height: 12),
        ...clubs.map(
          (club) => Card(
            elevation: 0,
            child: ListTile(
              leading: Icon(club.$2, color: navy),
              title: Text(club.$1),
              trailing: OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Club membership needs database integration.',
                      ),
                    ),
                  );
                },
                child: const Text('View'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class StudentServicesPage extends StatelessWidget {
  const StudentServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionTitle('Academic services'),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: const Icon(Icons.assessment, color: navy),
            title: const Text('My results'),
            subtitle: const Text('Private academic records'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ResultsPage(),
              ),
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.video_call, color: navy),
            title: const Text('Live lessons'),
            subtitle: const Text('Online lessons and replays'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const LiveLessonsPage(),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const ComingSoonCard(
          title: 'School fees',
          subtitle: 'Payment and balance services',
        ),
        const ComingSoonCard(
          title: 'Homework money',
          subtitle: 'Coming soon',
        ),
      ],
    );
  }
}

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Results')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'Results will be shown after secure student sign-in '
            'and school results integration are implemented.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class LiveLessonsPage extends StatelessWidget {
  const LiveLessonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live Lessons')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'Live classes and recorded lesson replays require a configured '
            'meeting provider and approved recording workflow.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final controller = TextEditingController();
  final messages = <String>[];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Private Messages')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Messaging is a demo screen. Secure accounts, delivery, '
              'blocking and reporting must be connected before use.',
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: messages.map((m) => ListTile(
                leading: const Icon(Icons.message_outlined),
                title: Text(m),
              )).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Write a demo message',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (controller.text.trim().isEmpty) return;
                    setState(() {
                      messages.add(controller.text.trim());
                      controller.clear();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({super.key});

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Anonymous Suggestion Box')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Share an idea or concern. This demo does not send or '
              'store your suggestion. A real version must protect identity '
              'and restrict access to authorized school staff.',
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              maxLines: 6,
              decoration: const InputDecoration(
                hintText: 'Write your suggestion...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  if (controller.text.trim().isEmpty) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Demo only: suggestion was not sent or saved.',
                      ),
                    ),
                  );
                  controller.clear();
                },
                child: const Text('Submit suggestion'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
