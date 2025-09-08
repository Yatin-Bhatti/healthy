import 'package:flutter/material.dart';

class PrivacySubScreen extends StatefulWidget {
  const PrivacySubScreen({super.key});

  @override
  State<PrivacySubScreen> createState() => _PrivacySubScreenState();
}

class _PrivacySubScreenState extends State<PrivacySubScreen> {
  bool showOnlineStatus = true;
  bool enableBiometrics = false;
  bool enable2FA = false;

  String profileVisibility = "Public";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy & Security",
          style: TextStyle(color: Colors.deepPurple), // 👈 Title color
        ),
        iconTheme: const IconThemeData(
          color: Colors.deepPurple, // 👈 Back button color
        ),

        centerTitle: true,
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Privacy",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          // Profile visibility dropdown
          ListTile(
            title: const Text("Profile visibility"),
            subtitle: Text(profileVisibility),
            trailing: DropdownButton<String>(
              value: profileVisibility,
              items: [
                "Public",
                "Private",
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) => setState(() => profileVisibility = val!),
            ),
          ),

          SwitchListTile(
            title: const Text("Show online status"),
            value: showOnlineStatus,
            onChanged: (val) => setState(() => showOnlineStatus = val),
          ),

          SwitchListTile(
            title: const Text("Show activity status"),
            subtitle: const Text("Allow others to see your last seen"),
            value: showOnlineStatus,
            onChanged: (val) => setState(() => showOnlineStatus = val),
          ),

          ListTile(
            title: const Text("Clear search history"),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Search history cleared")),
                );
              },
            ),
          ),

          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Security",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          // SwitchListTile(
          //   title: const Text("Enable biometric login"),
          //   value: enableBiometrics,
          //   onChanged: (val) => setState(() => enableBiometrics = val),
          // ),
          SwitchListTile(
            title: const Text("Two-factor authentication"),
            value: enable2FA,
            onChanged: (val) => setState(() => enable2FA = val),
          ),

          // ListTile(
          //   title: const Text("Change password"),
          //   trailing: const Icon(Icons.chevron_right),
          //   onTap: () {
          //     // Navigate to password change screen
          //   },
          // ),

          // ListTile(
          //   title: const Text("Manage devices"),
          //   subtitle: const Text("View and remove logged-in devices"),
          //   trailing: const Icon(Icons.chevron_right),
          //   onTap: () {
          //     // Navigate to devices screen
          //   },
          // ),
        ],
      ),
    );
  }
}
