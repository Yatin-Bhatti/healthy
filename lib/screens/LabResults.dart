import 'package:flutter/material.dart';

class LabResultsScreen extends StatefulWidget {
  const LabResultsScreen({super.key});

  @override
  State<LabResultsScreen> createState() => _LabResultsScreenState();
}

class _LabResultsScreenState extends State<LabResultsScreen> {
  final List<Map<String, dynamic>> labResults = [
    {
      "title": "Blood Test",
      "date": "20 Aug 2025",
      "status": "Normal",
      "color": Colors.green,
      "details": {
        "Hemoglobin": {"value": "13.5 g/dL", "range": "12-16"},
        "WBC": {"value": "7,500 /µL", "range": "4,000-11,000"},
        "Platelets": {"value": "220,000 /µL", "range": "150,000-400,000"},
      },
    },
    {
      "title": "Cholesterol Test",
      "date": "15 Aug 2025",
      "status": "High",
      "color": Colors.red,
      "details": {
        "Total Cholesterol": {"value": "250 mg/dL", "range": "< 200"},
        "HDL": {"value": "38 mg/dL", "range": "> 40"},
        "LDL": {"value": "160 mg/dL", "range": "< 100"},
      },
    },
    {
      "title": "Blood Sugar",
      "date": "10 Aug 2025",
      "status": "Borderline",
      "color": Colors.orange,
      "details": {
        "Fasting": {"value": "105 mg/dL", "range": "70-100"},
        "Post Meal": {"value": "155 mg/dL", "range": "< 140"},
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Lab Results",
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: labResults.length,
        itemBuilder: (context, index) {
          final result = labResults[index];
          return _buildResultCard(result);
        },
      ),
    );
  }

  Widget _buildResultCard(Map<String, dynamic> result) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  result["title"],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                Text(
                  result["date"],
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ),
            Chip(
              label: Text(
                result["status"],
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              backgroundColor: result["color"],
            ),
          ],
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...result["details"].entries.map<Widget>((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        entry.key,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            entry.value["value"],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            "Normal: ${entry.value["range"]}",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      // TODO: Implement PDF download
                    },
                    icon: const Icon(Icons.download, color: Colors.deepPurple),
                  ),
                  IconButton(
                    onPressed: () {
                      // TODO: Implement Share functionality
                    },
                    icon: const Icon(Icons.share, color: Colors.deepPurple),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
