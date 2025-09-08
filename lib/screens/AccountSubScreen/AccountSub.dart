import 'package:flutter/material.dart';

class AccountSubScreen extends StatelessWidget {
  const AccountSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Account",
          style: TextStyle(color: Colors.deepPurple), // 👈 Title color
        ),
        iconTheme: const IconThemeData(
          color: Colors.deepPurple, // 👈 Back button color
        ),

        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text("Email"),
            subtitle: const Text("user@example.com"),
            trailing: const Icon(Icons.edit),
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text("Phone"),
            subtitle: const Text("+91 9876543210"),
            trailing: const Icon(Icons.edit),
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text("Change Password"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size(200, 45), // 👈 width, height
            ),
            child: const Text(
              "Logout",
              style: TextStyle(color: Colors.deepPurple),
            ),
          ),
        ],
      ),
    );
  }
}
