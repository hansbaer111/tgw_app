import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/models/exercise_model.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/widgets/client/exercise_name_view.dart'; // Reusing this for exercise name
import 'package:test_app/providers/providers.dart'; // Central providers file
import 'package:intl/intl.dart';

class AnalyticsScreen extends ConsumerStatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  ConsumerState<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends ConsumerState<AnalyticsScreen> {
  UserModel? _selectedClient;
  ExerciseModel? _selectedExercise;

  @override
  Widget build(BuildContext context) {
    final allLogsAsync = ref.watch(allWorkoutLogsProvider);
    final allUsersAsync = ref.watch(allUsersProvider);
    final allExercisesAsync = ref.watch(exercisesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Client Selection
            allUsersAsync.when(
              data: (users) {
                final clients = users.where((u) => u.role == 'client').toList();
                return DropdownButtonFormField<UserModel>(
                  value: _selectedClient,
                  decoration: const InputDecoration(labelText: 'Select Client'),
                  items: clients.map((client) {
                    return DropdownMenuItem(value: client, child: Text(client.displayName));
                  }).toList(),
                  onChanged: (value) => setState(() => _selectedClient = value),
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (e, s) => const Text('Error loading clients'),
            ),
            const SizedBox(height: 16),
            // Exercise Selection
            allExercisesAsync.when(
              data: (exercises) {
                return DropdownButtonFormField<ExerciseModel>(
                  value: _selectedExercise,
                  decoration: const InputDecoration(labelText: 'Select Exercise'),
                  items: exercises.map((exercise) {
                    return DropdownMenuItem(value: exercise, child: Text(exercise.name));
                  }).toList(),
                  onChanged: (value) => setState(() => _selectedExercise = value),
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (e, s) => const Text('Error loading exercises'),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: allLogsAsync.when(
                data: (logs) {
                  if (logs.isEmpty) {
                    return const Center(child: Text('No workout data available for analytics.'));
                  }

                  // Filter logs by selected client and exercise
                  final filteredLogs = logs.where((log) {
                    return (_selectedClient == null || log.userId == _selectedClient!.uid) &&
                           (_selectedExercise == null || log.exercises.any((ex) => ex.exerciseId == _selectedExercise!.exerciseId));
                  }).toList();

                  if (filteredLogs.isEmpty) {
                    return const Center(child: Text('No data for selected filters.'));
                  }

                  // Aggregate data: Exercise ID -> Total Volume
                  final Map<String, double> exerciseVolume = {};
                  for (var log in filteredLogs) {
                    for (var exercise in log.exercises) {
                      double volume = 0;
                      for (var set in exercise.sets) {
                        volume += set.reps * set.weight;
                      }
                      exerciseVolume.update(exercise.exerciseId, (value) => value + volume, ifAbsent: () => volume);
                    }
                  }

                  // Prepare data for BarChart
                  final List<BarChartGroupData> barGroups = [];
                  int i = 0;
                  exerciseVolume.forEach((exerciseId, volume) {
                    barGroups.add(
                      BarChartGroupData(
                        x: i,
                        barRods: [
                          BarChartRodData(
                            toY: volume,
                            color: Colors.blue,
                            width: 16,
                          ),
                        ],
                      ),
                    );
                    i++;
                  });

                  // Prepare data for LineChart (Progress over time)
                  final List<FlSpot> exerciseProgressSpots = [];
                  if (_selectedClient != null && _selectedExercise != null) {
                    final clientExerciseLogs = filteredLogs
                        .where((log) => log.userId == _selectedClient!.uid)
                        .map((log) {
                          final exerciseEntry = log.exercises.firstWhere(
                              (ex) => ex.exerciseId == _selectedExercise!.exerciseId,
                              orElse: () => throw Exception('Exercise not found in log'));
                          double volume = 0;
                          for (var set in exerciseEntry.sets) {
                            volume += set.reps * set.weight;
                          }
                          return {'date': log.date, 'volume': volume};
                        })
                        .toList();

                    // Sort by date
                    clientExerciseLogs.sort((a, b) => (a['date'] as DateTime).compareTo(b['date'] as DateTime));

                    for (int j = 0; j < clientExerciseLogs.length; j++) {
                      exerciseProgressSpots.add(FlSpot(
                        (clientExerciseLogs[j]['date'] as DateTime).millisecondsSinceEpoch.toDouble(),
                        clientExerciseLogs[j]['volume'] as double,
                      ));
                    }
                  }

                  return Column(
                    children: [
                      Text('Total Volume per Exercise', style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 24),
                      Expanded(
                        child: BarChart(
                          BarChartData(
                            barGroups: barGroups,
                            titlesData: FlTitlesData(
                              show: true,
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    final exerciseId = exerciseVolume.keys.elementAt(value.toInt());
                                    return SideTitleWidget(
                                      meta: meta,
                                      space: 4.0,
                                      child: ExerciseNameView(exerciseId: exerciseId),
                                    );
                                  },
                                  reservedSize: 40,
                                ),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                              ),
                              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            ),
                            borderData: FlBorderData(show: false),
                            gridData: FlGridData(show: false),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      if (_selectedClient != null && _selectedExercise != null) ...[
                        Text('Progress for ${_selectedExercise!.name}', style: Theme.of(context).textTheme.headlineSmall),
                        const SizedBox(height: 24),
                        Expanded(
                          child: LineChart(
                            LineChartData(
                              gridData: FlGridData(show: true),
                              titlesData: FlTitlesData(
                                show: true,
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
                                      return SideTitleWidget(
                                        meta: meta,
                                        space: 4.0,
                                        child: Text(DateFormat.MMMd().format(date), style: const TextStyle(fontSize: 10)),
                                      );
                                    },
                                    reservedSize: 40,
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                                ),
                                                                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                                                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              ),
                              borderData: FlBorderData(show: true),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: exerciseProgressSpots,
                                  isCurved: true,
                                  color: Colors.green,
                                  barWidth: 4,
                                  isStrokeCapRound: true,
                                  dotData: FlDotData(show: true),
                                  belowBarData: BarAreaData(show: false),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(child: Text('Error: $err')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
