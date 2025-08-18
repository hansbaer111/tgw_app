import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:test_app/models/day_model.dart'; // Import DayModel
import 'package:test_app/providers/providers.dart';
import 'package:test_app/screens/client/live_workout_screen.dart'; // Import LiveWorkoutScreen

class TrainingsplaeneTab extends ConsumerWidget {
  const TrainingsplaeneTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeClientPlanAsyncValue = ref.watch(activeClientPlanProvider);
    final workoutLogsStreamAsyncValue = ref.watch(workoutLogsStreamProvider);

    return activeClientPlanAsyncValue.when(
      data: (activePlan) {
        if (activePlan == null) {
          return const Center(child: Text('No active training plan found.'));
        }

        final workoutTemplateAsyncValue = ref.watch(workoutTemplateProvider(activePlan.templateId));

        return workoutTemplateAsyncValue.when(
          data: (template) {
            return workoutLogsStreamAsyncValue.when(
              data: (workoutLogs) {
                Map<DateTime, List<dynamic>> events = {};
                for (var log in workoutLogs) {
                  final date = DateTime.utc(log.date.year, log.date.month, log.date.day);
                  events[date] = events[date] ?? [];
                  events[date]!.add(log);
                }

                return Column(
                  children: [
                    TableCalendar(
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: DateTime.now(),
                      calendarFormat: CalendarFormat.month,
                      eventLoader: (day) {
                        return events[day] ?? [];
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        // Find the corresponding DayModel for the selected day
                        final selectedDayModel = template.days.firstWhere(
                          (dayModel) => dayModel.name == selectedDay.weekday.toString(), // Assuming dayModel.name stores weekday as string
                          orElse: () => DayModel(name: 'Rest Day', exercises: []), // Default for rest days or not found
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LiveWorkoutScreen(day: selectedDayModel),
                          ),
                        );
                      },
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, day, focusedDay) {
                          final isCompleted = events[day]?.isNotEmpty ?? false;
                          final isPlanned = template.days.any((d) => d.name == day.weekday.toString());
                          Color color = Colors.grey;
                          if (isCompleted) {
                            color = Colors.green;
                          } else if (isPlanned && day.isBefore(DateTime.now())) {
                            color = Colors.red;
                          }

                          return Container(
                            margin: const EdgeInsets.all(6.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '${day.day}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(child: Text('Error loading workout logs: $error')),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error loading workout template: $error')),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error loading active client plan: $error')),
    );
  }
}