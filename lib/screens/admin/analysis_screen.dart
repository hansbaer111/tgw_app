import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/models/exercise_model.dart';
import 'package:test_app/models/user_model.dart'; // Import UserModel
import 'package:test_app/providers/providers.dart'; // Import providers
import 'package:fl_chart/fl_chart.dart'; // Import fl_chart

class AnalysisScreen extends ConsumerStatefulWidget {
  const AnalysisScreen({Key? key}) : super(key: key);

  @override
  _AnalysisScreenState createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends ConsumerState<AnalysisScreen> {
  ExerciseModel? _selectedExercise;
  String? _selectedMetric; // e1RM or eX-RM
  List<UserModel> _selectedClients = []; // To store selected clients
  bool _showChart = false; // Control chart visibility

  final List<String> _metrics = ['e1RM', 'eX-RM']; // Hardcoded metrics for now

  // Placeholder for chart data
  List<LineChartBarData> _chartData = [];

  void _generateGraph() {
    // TODO: Implement actual data fetching and processing for the chart
    setState(() {
      _showChart = true;
      // Dummy data for demonstration
      _chartData = [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(1, 5),
            FlSpot(2, 4),
            FlSpot(3, 7),
            FlSpot(4, 4),
          ],
          isCurved: true,
          color: Colors.blue,
          barWidth: 4,
          belowBarData: BarAreaData(show: false),
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    final globalExercisesAsyncValue = ref.watch(globalExercisesProvider);
    final allUsersAsyncValue = ref.watch(allUsersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analysis'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Exercise Dropdown
            globalExercisesAsyncValue.when(
              data: (exercises) {
                return DropdownButtonFormField<ExerciseModel>(
                  value: _selectedExercise,
                  hint: const Text('Select Exercise'),
                  onChanged: (ExerciseModel? newValue) {
                    setState(() {
                      _selectedExercise = newValue;
                    });
                  },
                  items: exercises.map((exercise) {
                    return DropdownMenuItem<ExerciseModel>(
                      value: exercise,
                      child: Text(exercise.name),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select an exercise';
                    }
                    return null;
                  },
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Text('Error loading exercises: $error'),
            ),
            const SizedBox(height: 20),
            // Metric Dropdown
            DropdownButtonFormField<String>(
              value: _selectedMetric,
              hint: const Text('Select Metric'),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedMetric = newValue;
                });
              },
              items: _metrics.map((metric) {
                return DropdownMenuItem<String>(
                  value: metric,
                  child: Text(metric),
                );
              }).toList(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a metric';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            // Client selection with checkboxes
            Expanded(
              child: allUsersAsyncValue.when(
                data: (users) {
                  if (users.isEmpty) {
                    return const Center(child: Text('No clients found.'));
                  }
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      // Only show clients, not admins or pending users
                      if (user.role == 'client' && user.status == 'approved') {
                        return CheckboxListTile(
                          title: Text(user.displayName),
                          value: _selectedClients.contains(user),
                          onChanged: (bool? selected) {
                            setState(() {
                              if (selected == true) {
                                _selectedClients.add(user);
                              } else {
                                _selectedClients.remove(user);
                              }
                            });
                          },
                        );
                      }
                      return const SizedBox.shrink(); // Hide non-client or pending users
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error loading clients: $error')),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateGraph,
              child: const Text('Graph generieren'),
            ),
            const SizedBox(height: 20),
            _showChart
                ? Expanded(
                    child: LineChart(
                      LineChartData(
                        lineBarsData: _chartData,
                        titlesData: FlTitlesData(show: false), // Hide titles for simplicity
                        borderData: FlBorderData(show: false), // Hide border
                        gridData: FlGridData(show: false), // Hide grid
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}