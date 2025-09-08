import 'package:flutter/material.dart';

class NotificationSubScreen extends StatefulWidget {
  const NotificationSubScreen({super.key});

  @override
  State<NotificationSubScreen> createState() => _NotificationSubScreenState();
}

class _NotificationSubScreenState extends State<NotificationSubScreen> {
  bool pushEnabled = true;
  bool messageEnabled = true;
  bool friendRequestEnabled = false;
  bool remindersEnabled = true;
  bool updatesEnabled = true;
  bool soundEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notification",
          style: TextStyle(color: Colors.deepPurple), // 👈 Title color
        ),
        iconTheme: const IconThemeData(
          color: Colors.deepPurple, // 👈 Back button color
        ),

        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF8F2FC), // light lavender background
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSwitchTile(
            title: "Enable Push Notifications",
            value: pushEnabled,
            icon: Icons.notifications_active_outlined,
            onChanged: (val) => setState(() => pushEnabled = val),
          ),
          const SizedBox(height: 12),
          _buildSwitchTile(
            title: "Messages",
            value: messageEnabled,
            icon: Icons.chat_bubble_outline,
            onChanged: (val) => setState(() => messageEnabled = val),
          ),
          // _buildSwitchTile(
          //   title: "Friend Requests",
          //   value: friendRequestEnabled,
          //   icon: Icons.person_add_alt_1_outlined,
          //   onChanged: (val) => setState(() => friendRequestEnabled = val),
          // ),
          _buildSwitchTile(
            title: "Activity Reminders",
            value: remindersEnabled,
            icon: Icons.access_alarm_outlined,
            onChanged: (val) => setState(() => remindersEnabled = val),
          ),
          _buildSwitchTile(
            title: "App Updates & Tips",
            value: updatesEnabled,
            icon: Icons.system_update_alt_outlined,
            onChanged: (val) => setState(() => updatesEnabled = val),
          ),
          const Divider(height: 32, thickness: 1),
          _buildSwitchTile(
            title: "Notification Sound",
            value: soundEnabled,
            icon: Icons.volume_up_outlined,
            onChanged: (val) => setState(() => soundEnabled = val),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required IconData icon,
    required Function(bool) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SwitchListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        secondary: Icon(icon, color: const Color(0xFF6C3E9E)),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF333333),
          ),
        ),
        value: value,
        activeThumbColor: const Color(0xFF6C3E9E),
        onChanged: onChanged,
      ),
    );
  }
}
