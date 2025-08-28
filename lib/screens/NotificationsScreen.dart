import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Page Title
              const Text(
                "Notifications",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 20),

              // Notifications List
              Expanded(
                child: ListView(
                  children: const [
                    NotificationTile(
                      color: Colors.deepPurple,
                      title: "Notification Title",
                      subtitle:
                          "Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, ipsum dolor",
                    ),
                    SizedBox(height: 12),
                    NotificationTile(
                      color: Colors.orange,
                      title: "Notification Title",
                      subtitle:
                          "Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, ipsum dolor",
                    ),
                    SizedBox(height: 12),
                    NotificationTile(
                      color: Colors.lightBlue,
                      title: "Notification Title",
                      subtitle:
                          "Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, ipsum dolor",
                    ),
                    SizedBox(height: 12),
                    NotificationTile(
                      color: Colors.orange,
                      title: "Notification Title",
                      subtitle:
                          "Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, ipsum dolor",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Notification Card Widget
class NotificationTile extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;

  const NotificationTile({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.15)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Colored Dot
          Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12),

          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
