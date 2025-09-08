import 'package:flutter/material.dart';

class AppearanceSubScreen extends StatefulWidget {
  const AppearanceSubScreen({super.key});

  @override
  State<AppearanceSubScreen> createState() => _AppearanceSubScreenState();
}

class _AppearanceSubScreenState extends State<AppearanceSubScreen> {
  String themeMode = "System Default";
  String fontSize = "Medium";
  String appIcon = "Classic";
  Color accentColor = const Color(0xFF6C3E9E); // default purple

  final List<Color> accentColors = [
    Color(0xFF6C3E9E), // Purple
    Color(0xFF3E8E9E), // Teal
    Color(0xFFE67E22), // Orange
    Color(0xFF27AE60), // Green
    Color(0xFF2980B9), // Blue
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Appearance",
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
          _buildOptionCard(
            title: "Theme Mode",
            child: DropdownButton<String>(
              value: themeMode,
              isExpanded: true,
              underline: const SizedBox(),
              items: [
                "Light",
                "Dark",
                "System Default",
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) => setState(() => themeMode = val!),
            ),
          ),
          const SizedBox(height: 16),
          _buildOptionCard(
            title: "Accent Color",
            child: Row(
              children: accentColors.map((color) {
                return GestureDetector(
                  onTap: () => setState(() => accentColor = color),
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: accentColor == color
                            ? Colors.black
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          _buildOptionCard(
            title: "Font Size",
            child: DropdownButton<String>(
              value: fontSize,
              isExpanded: true,
              underline: const SizedBox(),
              items: [
                "Small",
                "Medium",
                "Large",
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) => setState(() => fontSize = val!),
            ),
          ),
          const SizedBox(height: 16),
          _buildOptionCard(
            title: "App Icon Style",
            child: DropdownButton<String>(
              value: appIcon,
              isExpanded: true,
              underline: const SizedBox(),
              items: [
                "Classic",
                "Minimal",
                "Vibrant",
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) => setState(() => appIcon = val!),
            ),
          ),
          const SizedBox(height: 24),
          _buildPreviewCard(),
        ],
      ),
    );
  }

  Widget _buildOptionCard({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Widget _buildPreviewCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Preview",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                "Sample Text",
                style: TextStyle(
                  fontSize: fontSize == "Small"
                      ? 14
                      : fontSize == "Large"
                      ? 20
                      : 16,
                  fontWeight: FontWeight.w500,
                  color: accentColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
