import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatScreen extends StatelessWidget {
  const StatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "📊 Your Health Stats",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6C3E9E),
                ),
              ),
              const SizedBox(height: 16),

              /// --- Quick Summary Cards ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _statCard("Steps", "7,842", Icons.directions_walk),
                  _statCard("Calories", "1,950", Icons.local_fire_department),
                  _statCard("Sleep", "7.5h", Icons.bedtime),
                ],
              ),

              const SizedBox(height: 24),

              /// --- Weight Progress (Line Chart) ---
              _chartCard(
                title: "Weight Progress",
                child: SizedBox(
                  height: 150,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(show: false),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: const [
                            FlSpot(0, 70),
                            FlSpot(1, 69.5),
                            FlSpot(2, 69.2),
                            FlSpot(3, 68.8),
                            FlSpot(4, 68.5),
                          ],
                          isCurved: true,
                          color: const Color(0xFF6C3E9E),
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true,
                            color: const Color(0xFF6C3E9E).withOpacity(0.2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              /// --- Weekly Sleep Hours (Bar Chart) ---
              _chartCard(
                title: "Weekly Sleep Hours",
                child: SizedBox(
                  height: 150,
                  child: BarChart(
                    BarChartData(
                      borderData: FlBorderData(show: false),
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              const days = ["M", "T", "W", "T", "F", "S", "S"];
                              if (value.toInt() >= 0 &&
                                  value.toInt() < days.length) {
                                return Text(
                                  days[value.toInt()],
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                      ),
                      barGroups: [
                        BarChartGroupData(
                          x: 0,
                          barRods: [
                            BarChartRodData(
                              toY: 7,
                              color: const Color(0xFF6C3E9E),
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barRods: [
                            BarChartRodData(
                              toY: 6,
                              color: const Color(0xFF6C3E9E),
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barRods: [
                            BarChartRodData(
                              toY: 8,
                              color: const Color(0xFF6C3E9E),
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 3,
                          barRods: [
                            BarChartRodData(
                              toY: 7.5,
                              color: const Color(0xFF6C3E9E),
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 4,
                          barRods: [
                            BarChartRodData(
                              toY: 6.5,
                              color: const Color(0xFF6C3E9E),
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 5,
                          barRods: [
                            BarChartRodData(
                              toY: 7.8,
                              color: const Color(0xFF6C3E9E),
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 6,
                          barRods: [
                            BarChartRodData(
                              toY: 8.2,
                              color: const Color(0xFF6C3E9E),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              /// --- Nutrition Breakdown (Pie Chart) ---
              _chartCard(
                title: "Nutrition Breakdown",
                child: SizedBox(
                  height: 150,
                  child: PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          value: 40,
                          color: Colors.orange,
                          title: "Carbs\n40%",
                          radius: 50,
                          titleStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        PieChartSectionData(
                          value: 30,
                          color: Colors.green,
                          title: "Protein\n30%",
                          radius: 50,
                          titleStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        PieChartSectionData(
                          value: 30,
                          color: Colors.blue,
                          title: "Fats\n30%",
                          radius: 50,
                          titleStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// --- Achievements ---
              const Text(
                "🏆 Achievements",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6C3E9E),
                ),
              ),
              const SizedBox(height: 12),
              _achievementCard("7-Day Water Intake Goal Completed!"),
              _achievementCard("5K Steps Daily Streak!"),
            ],
          ),
        ),
      ),
    );
  }

  /// --- Small Summary Card ---
  Widget _statCard(String title, String value, IconData icon) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: const Color(0xFFF2E9FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 28, color: const Color(0xFF6C3E9E)),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6C3E9E),
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  /// --- Chart Card Wrapper ---
  Widget _chartCard({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF2E9FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6C3E9E),
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  /// --- Achievement Card ---
  Widget _achievementCard(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF2E9FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, color: Color(0xFF6C3E9E)),
      ),
    );
  }
}
