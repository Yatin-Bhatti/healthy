import 'package:flutter/material.dart';

import '../widgets/FeatureTile.dart';
import '../screens/ChatScreen.dart'; // <-- import the new screen
import "../screens/MedicalHistory.dart";
import "../screens/FindYourself.dart";
import "../screens/LabResults.dart";
import "../screens/DietChart.dart";

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    const tileColor = Color(0xFFF1ECFA);

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      children: [
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
        FeatureTile(
          title: "Your Diet Chart",
          tileColor: tileColor,
          asset: "assets/dietChart.png",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DietChartScreen()),
            );
          },
        ),
        const SizedBox(height: 14),
        FeatureTile(
          title: "Medical History",
          tileColor: tileColor,
          asset: "assets/medicalHistory.png",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MedicalHistoryScreen()),
            );
          },
        ),
        const SizedBox(height: 14),
        FeatureTile(
          title: "Lab Results",
          tileColor: tileColor,
          asset: "assets/labResults.png",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LabResultsScreen()),
            );
          },
        ),
        const SizedBox(height: 14),
        FeatureTile(
          title: "Online Chat",
          tileColor: tileColor,
          asset: "assets/onlineChat.png",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ChatScreen()),
            );
          },
        ),
        const SizedBox(height: 14),
        FeatureTile(
          title: "Finding yourself",
          tileColor: tileColor,
          asset: "assets/findYourself.png",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FindYourselfScreen()),
            );
          },
        ),
      ],
    );
  }
}
