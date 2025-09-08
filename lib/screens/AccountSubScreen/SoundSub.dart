import 'package:flutter/material.dart';

class SoundSubScreen extends StatefulWidget {
  const SoundSubScreen({super.key});

  @override
  State<SoundSubScreen> createState() => _SoundSubScreenState();
}

class _SoundSubScreenState extends State<SoundSubScreen> {
  bool appSounds = true;
  bool notificationSounds = true;
  bool vibration = true;
  double notificationVolume = 0.7;
  double appVolume = 0.5;
  String selectedTone = "Default";

  final List<String> tones = ["Default", "Chime", "Ding", "Echo"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sound",
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
          const Text(
            "General",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SwitchListTile(
            title: const Text("App Sounds"),
            value: appSounds,
            onChanged: (val) => setState(() => appSounds = val),
          ),
          SwitchListTile(
            title: const Text("Notification Sounds"),
            value: notificationSounds,
            onChanged: (val) => setState(() => notificationSounds = val),
          ),
          SwitchListTile(
            title: const Text("Vibration"),
            value: vibration,
            onChanged: (val) => setState(() => vibration = val),
          ),
          const SizedBox(height: 20),

          const Text(
            "Volume",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text("Notification Volume"),
          Slider(
            value: notificationVolume,
            onChanged: (val) => setState(() => notificationVolume = val),
            min: 0,
            max: 1,
            divisions: 10,
            label: (notificationVolume * 100).round().toString(),
          ),
          const SizedBox(height: 8),
          Text("App Sounds Volume"),
          Slider(
            value: appVolume,
            onChanged: (val) => setState(() => appVolume = val),
            min: 0,
            max: 1,
            divisions: 10,
            label: (appVolume * 100).round().toString(),
          ),
          const SizedBox(height: 20),

          const Text(
            "Notification Tone",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...tones.map(
            (tone) => RadioListTile<String>(
              title: Text(tone),
              value: tone,
              groupValue: selectedTone,
              onChanged: (val) => setState(() => selectedTone = val!),
            ),
          ),
          const SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: () {
              // play preview sound logic goes here
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Previewing $selectedTone tone")),
              );
            },
            icon: const Icon(Icons.play_arrow),
            label: const Text("Preview Tone"),
          ),
        ],
      ),
    );
  }
}
