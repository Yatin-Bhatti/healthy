import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Light lavender like the mock
    const tileColor = Color(0xFFF1ECFA);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          children: [
            // Top bar: greeting + profile avatar
            Row(
              children: [
                const Text(
                  "👋  Hi Julia!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepPurple,
                  ),
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 18,
                  backgroundColor: tileColor,
                  child: const Icon(Icons.person, color: Colors.deepPurple),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Feature cards (exact spacing/rounded look)
            _FeatureTile(
              title: "Your Diet Chart",
              tileColor: tileColor,
              // Use your own asset illustrations here
              asset: "assets/selfcare.png",
              onTap: () {},
            ),
            const SizedBox(height: 14),
            _FeatureTile(
              title: "Medical History",
              tileColor: tileColor,
              asset: "assets/selfcare.png",
              onTap: () {},
            ),
            const SizedBox(height: 14),
            _FeatureTile(
              title: "Lab Results",
              tileColor: tileColor,
              asset: "assets/selfcare.png",
              onTap: () {},
            ),
            const SizedBox(height: 14),
            _FeatureTile(
              title: "Online Chat",
              tileColor: tileColor,
              asset: "assets/selfcare.png",
              onTap: () {},
            ),
            const SizedBox(height: 14),
            _FeatureTile(
              title: "Finding yourself",
              tileColor: tileColor,
              asset: "assets/selfcare.png",
              onTap: () {},
            ),
          ],
        ),
      ),

      // Bottom tabs (icons only, no labels—like the mock)
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.deepPurple.shade200,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: 'Grid',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_rounded),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

/// Single feature card styled like the screenshot
class _FeatureTile extends StatelessWidget {
  final String title;
  final String asset;
  final Color tileColor;
  final VoidCallback? onTap;

  const _FeatureTile({
    required this.title,
    required this.asset,
    required this.tileColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        height: 84,
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            // Left: title
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            // Right: illustration
            SizedBox(
              height: 70,
              width: 86,
              child: Image.asset(asset, fit: BoxFit.contain),
            ),
          ],
        ),
      ),
    );
  }
}
