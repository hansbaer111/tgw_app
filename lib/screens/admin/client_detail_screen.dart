import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/screens/client/trainingsplaene_tab.dart'; // Reuse TrainingsplaeneTab
import 'package:test_app/screens/client/logbuch_tab.dart'; // Reuse LogbuchTab

class ClientDetailScreen extends ConsumerWidget {
  final String userId;
  const ClientDetailScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2, // Only Kalender and Logbuch
      child: Scaffold(
        appBar: AppBar(
          title: Text('Client Detail: $userId'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Kalender'),
              Tab(text: 'Logbuch'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Kalender Tab - Reusing TrainingsplaeneTab
            // Note: TrainingsplaeneTab currently fetches data for the current user.
            // To display data for a specific client (userId), you would need to
            // modify TrainingsplaeneTab or create a new provider/widget that
            // accepts userId as a parameter. For now, it will show current user's data.
            TrainingsplaeneTab(),
            // Logbuch Tab - Reusing LogbuchTab
            // Similar to TrainingsplaeneTab, LogbuchTab currently fetches data for the current user.
            // You would need to modify LogbuchTab or create a new provider/widget that
            // accepts userId as a parameter. For now, it will show current user's data.
            LogbuchTab(),
          ],
        ),
      ),
    );
  }
}
