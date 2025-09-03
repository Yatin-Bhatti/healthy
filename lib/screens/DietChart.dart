import 'package:flutter/material.dart';

class DietChartScreen extends StatelessWidget {
  const DietChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Diet Chart",
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Daily Meals
            Text(
              "Today's Meals 🍽️",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 12),

            _mealCard(
              "Breakfast",
              "Oatmeal, Banana, Almond Milk",
              "350 kcal",
              Icons.free_breakfast,
            ),
            _mealCard(
              "Lunch",
              "Grilled Chicken, Quinoa, Salad",
              "550 kcal",
              Icons.lunch_dining,
            ),
            _mealCard(
              "Snacks",
              "Greek Yogurt, Nuts, Apple",
              "200 kcal",
              Icons.local_cafe,
            ),
            _mealCard(
              "Dinner",
              "Salmon, Brown Rice, Veggies",
              "500 kcal",
              Icons.dinner_dining,
            ),

            const SizedBox(height: 24),

            // Nutrition Breakdown
            Text(
              "Nutrition Breakdown 🥗",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 12),

            _progressBar("Calories", 1600, 2000, Colors.orange),
            _progressBar("Protein", 70, 100, Colors.green),
            _progressBar("Carbs", 220, 300, Colors.blue),
            _progressBar("Fat", 50, 70, Colors.red),

            const SizedBox(height: 24),

            // Daily Tip
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.purple.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.lightbulb, color: Colors.orange),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "💡 Tip: Stay hydrated! Drink at least 8 glasses of water today.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mealCard(String title, String items, String calories, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.purple.shade50,
      child: ListTile(
        leading: Icon(icon, size: 32, color: Colors.purple.shade400),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.purple.shade700,
          ),
        ),
        subtitle: Text(items),
        trailing: Text(
          calories,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _progressBar(String label, int value, int max, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label: $value/$max",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.purple.shade700,
          ),
        ),
        const SizedBox(height: 6),
        LinearProgressIndicator(
          value: value / max,
          backgroundColor: Colors.purple.shade100,
          color: color,
          minHeight: 8,
          borderRadius: BorderRadius.circular(12),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
