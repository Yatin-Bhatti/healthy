import 'package:flutter/material.dart';

// Import all sub-screens
import 'AccountSubScreen/AccountSub.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false, // left-aligned
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Profile Section
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.deepPurple,
                  child: CircleAvatar(
                    radius: 42,
                    backgroundImage: AssetImage("assets/avatar.png"),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.deepPurple,
                      child: const Icon(
                        Icons.edit,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),
          const Text(
            "Julia Mario",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "juliamario@mail.com",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 30),

          // Settings Options
          Expanded(
            child: ListView(
              children: [
                _buildSettingsItem(
                  context,
                  Icons.person_outline,
                  "Account",
                  const AccountSubScreen(),
                ),
                // _buildSettingsItem(
                //   context,
                //   Icons.notifications_none,
                //   "Notification",
                //   const NotificationScreen(),
                // ),
                // _buildSettingsItem(
                //   context,
                //   Icons.remove_red_eye_outlined,
                //   "Appearance",
                //   const AppearanceScreen(),
                // ),
                // _buildSettingsItem(
                //   context,
                //   Icons.security_outlined,
                //   "Privacy & Security",
                //   const PrivacySecurityScreen(),
                // ),
                // _buildSettingsItem(
                //   context,
                //   Icons.volume_up_outlined,
                //   "Sound",
                //   const SoundScreen(),
                // ),
                // _buildSettingsItem(
                //   context,
                //   Icons.language_outlined,
                //   "Language",
                //   const LanguageScreen(),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(
    BuildContext context,
    IconData icon,
    String title,
    Widget screen,
  ) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.deepPurple,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () => _navigateTo(context, screen),
    );
  }
}
